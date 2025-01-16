Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485B22BAB0
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737035687; cv=none; b=SXSfJdheaIhNdetLGFyg0por8dQt+PnzGLV0y8Rkbf/9qAd86Tf56+nKRMJ7TmAr3gru82WmVy/VgvE/lBTUBbjeKxK7tthP51gXbQoij3tYBw8ZXBYyjZMQd3W3wuyHbR1pbglijLj76S8ATPAMKYmzlUOHgEKGca11nZApd1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737035687; c=relaxed/simple;
	bh=44d/KNFe8ozkeaq7IQ5Sv9h6dT0hWOgYDawnmRWXc0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qvl1FwQtQpWGdZ7chIDIQRQtP9BBgvboif+SZix9uI1c5f9cE38chmOa95H0HP9DLaSxGTtdDJFdNu3WR6NTEOSGgHmrbZyner/skG+rhYpkrOpda++vzQ6UI/NIZS/UgXJ+jH9zig8NztHeJQJT3dlR9Q8XdxR3Hr3vsSstxeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mo7Vu29J; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mo7Vu29J"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2164861e1feso17947175ad.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 05:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737035686; x=1737640486; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYrUzWw505HeBsvBgwJ+7hL3A+NEhIeuEpkKA+DPI1o=;
        b=Mo7Vu29JiXXtNA8+gyzykHt//UxzBkojog95A9vjED4JQK8e7OTVlENraGZBk7Mxli
         AYWSewxr35Ki4y1KjYiyIwSaABBUdPjxmJo0D5SmBfPFP2EnzWF3CcX/mKzj/AJs96qK
         XNF1U/7IBumZEPw2GayixhGeTf2TUCjnNdWG1DUjT99i8W1uDAQtB23gta6ZUZNrBH9j
         lSYn6vnuf87pOM9CcSpeG1hHjaqIOtrGcjhbSzi/SlkcV33vUoPgzU/MWfdnftPDXxXi
         OUuTvGBEQbg+OUAa/g6mo+HNq/jw7pmBtzVIEZh28tK3t1vl2TeUbb5Q8OI2pPNbBvfH
         tmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737035686; x=1737640486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYrUzWw505HeBsvBgwJ+7hL3A+NEhIeuEpkKA+DPI1o=;
        b=Gj+pPgmYstkfCeTl9PBqXdHWt9m65hIoAXTErbTDIApAiL9ffVKfU+SiDe6S3NRkY5
         i4GbyVWbe2wMV8pvO00sWWOD6LNKOrv5t4ZGHLzFORpyrW5P7nBDBfGyMweVQIlEeSNp
         79PbX6XG2bqg35XbPldxENp8GbUVs3oiiUI/8hJDPivxWNiOTORmzQ9Y9GLrgaeHERCI
         5gkox+PBMevPExLm/NOMVkt+I3pnkPc+VACOoZlyTH0HpYbhFrQ/2ssRCanCJQHdRdwd
         zz6jzT/+hpEZMXmjf+Lp+odBXc9uYipnrZjOG+cPbG3U9LEuD1M7/dYnJuttmuGrvvMU
         kSJg==
X-Forwarded-Encrypted: i=1; AJvYcCXYH8+NQr4sYUS+IQloKKFNMmPcghekLHZQjGlHC9Bl/blQh8TUiaMVR8iy5Dv2Lrw/b/Te/A8sOgetjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwISi/Fma0UqQ1xGoIGRixxjddMOac9uCPoMhZ7MIpuTNm2vG7O
	8GdXWqJHoRQy7SiWEFs4hX3TSR8yrj+V/UGhcrDFQH8ATwvVABCMGX/QKt8XxPLNWo9TVpPIXsN
	xlD+p4JCFl1+epQ==
X-Google-Smtp-Source: AGHT+IEN6RJMTRCurCA5eBKu8ibDx+SBYtk85d0q5M8XnMck/wVGJLpwmEbnoafhYxK2i9Tb3qQcC2ddBxlcFQ8=
X-Received: from pgy29.prod.google.com ([2002:a63:185d:0:b0:a97:3102:ea5d])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7881:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1e88d048873mr50006234637.26.1737035685770;
 Thu, 16 Jan 2025 05:54:45 -0800 (PST)
Date: Thu, 16 Jan 2025 13:50:16 +0000
In-Reply-To: <20250116135358.2335615-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250116135358.2335615-1-guanyulin@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116135358.2335615-5-guanyulin@google.com>
Subject: [PATCH v8 4/5] xhci: sideband: add api to trace sideband usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing sideband driver only registers sidebands without tracking
their active usage. To address this, new apis are introduced to:
- mark sideband usage: record the sideband usage information in the USB
  device driver.
- query sideband status: provide a means for other drivers to fetch
  sideband activity information on a USB host controller.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/host/xhci-sideband.c  | 82 +++++++++++++++++++++++++++++++
 include/linux/usb/xhci-sideband.h |  6 +++
 2 files changed, 88 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index ffa6f1b825ff..d4931315dcf4 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -358,6 +358,88 @@ xhci_sideband_interrupter_id(struct xhci_sideband *sb)
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 
+/**
+ * xhci_sideband_get - record a new active sideband instance
+ * @sb: sideband instance for this usb device
+ *
+ * An active sideband indicates that another entity is currently using the host
+ * controller. Inform the usb_device associated with this sideband instance via
+ * usb_offload_get(). This allows the corresponding drivers to dynamically
+ * adjust power management actions based on current sideband activities.
+ *
+ * Returns 0 on success, negative error otherwise.
+ */
+int xhci_sideband_get(struct xhci_sideband *sb)
+{
+	struct usb_device *udev;
+	struct usb_hcd *hcd;
+	int ret = 0;
+
+	if (!sb || !sb->xhci)
+		return -ENODEV;
+
+	hcd = xhci_to_hcd(sb->xhci);
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_get(udev);
+	device_unlock(&udev->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_get);
+
+/**
+ * xhci_sideband_put - record a deactivated sideband instance
+ * @sb: sideband instance for this usb device
+ *
+ * The inverse operation of xhci_sideband_get, which informs the associated
+ * usb_device via usb_offload_put(). This allows the corresponding drivers to
+ * dynamically adjust power management actions based on sideband activities.
+ *
+ * Returns 0 on success, negative error otherwise.
+ */
+int xhci_sideband_put(struct xhci_sideband *sb)
+{
+	struct usb_device *udev;
+	struct usb_hcd *hcd;
+	int ret = 0;
+
+	if (!sb || !sb->xhci)
+		return -ENODEV;
+
+	hcd = xhci_to_hcd(sb->xhci);
+	udev = sb->vdev->udev;
+	device_lock(&udev->dev);
+	ret = usb_offload_put(udev);
+	device_unlock(&udev->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_put);
+
+/**
+ * xhci_sideband_check - check the existence of active sidebands
+ * @hcd: the host controller driver associated with the target host controller
+ *
+ * Allow other drivers, such as usb controller driver, to check if there are
+ * any sideband activity on the host controller. This information could be used
+ * for power management or other forms of resource management.
+ *
+ * Returns true on any active sideband existence, false otherwise.
+ */
+bool xhci_sideband_check(struct usb_hcd *hcd)
+{
+	struct usb_device *udev = hcd->self.root_hub;
+	bool active;
+
+	device_lock(&udev->dev);
+	active = usb_offload_check(udev);
+	device_unlock(&udev->dev);
+
+	return active;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_check);
+
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 72aa17eb068d..6de1d9c161a1 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -11,6 +11,7 @@
 
 #include <linux/scatterlist.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
 
@@ -82,6 +83,11 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 				  struct usb_host_endpoint *host_ep);
 struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
+
+int xhci_sideband_get(struct xhci_sideband *sb);
+int xhci_sideband_put(struct xhci_sideband *sb);
+bool xhci_sideband_check(struct usb_hcd *hcd);
+
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 				 bool ip_autoclear, u32 imod_interval, int intr_num);
-- 
2.48.0.rc2.279.g1de40edade-goog

