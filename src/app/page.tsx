"use client";
import { useEffect, useRef } from "react";

export default function TrangChu() {
  const iframeRef = useRef<HTMLIFrameElement>(null);

  useEffect(() => {
    const iframe = iframeRef.current;
    if (iframe) iframe.src = "/html-designs/Trang%20chủ.html";
  }, []);

  return (
    <div className="w-full h-screen">
      <iframe
        ref={iframeRef}
        className="w-full h-full border-0"
        title="Trang chủ Pagoda"
      />
    </div>
  );
}
