Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2EB37C932;
	Tue,  3 Mar 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567325; cv=pass; b=LQunq5WE21J61U6/3i0UDIOqE/FgOQGpb7U5gvLck+M2c9zXJplf/03xrmla6t/jX7aswwkdnnikXhpgU7OVMEdLsBZJNJjB2fsj3KAXkrZn6hKsqLeagEa4cJ7aTa2aq/YkYUMOzJmH5Tv9wloY2zZCrFrkcibhjYHAACK1zPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567325; c=relaxed/simple;
	bh=Gt1pwsGJPq7luoF4wZqMPto7/GcBrVpk5nSnpRgW9W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlN3FD9MGb/RY1/WuQO64kjmW43PZdeaFey3WwjPlHZ6KCugre/XSoxOm8jEGRHW2Du3IAcWgtVvxQqJUGjWfrkG1I/qJ8J9u4kZKiXOo6tvBogKffKGKLYamXwuMo2aoTDwNNKvhajnyzBAexVPT0OTTdyGSYXwI9KoKryH2zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=gOnhMWoI; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="gOnhMWoI"
ARC-Seal: i=1; a=rsa-sha256; t=1772567309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D/ojVr+9IA5gfH/F4TH+Y9trGwRx03ibzEt0rKPCcBPyGe/M0ibUfDykF3By4gHGEbgxUrkrlyYiJWC58xhpZlp/IRzTZJ/FfCPRnZlSsZnwGyW6cNmdlWg4s0gDirBC+eWdQS+FJnP2p5TIGbD+aCNtXGNO5GECSlYilWFHtlU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567309; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GdODKBTj69CoOEfVAMgHkBpJL6zX0edZTyHBVBanc6s=; 
	b=hL9zo0MDE7iP8es1m/MjIRwsOKHsYX4haAH19Mvjbwcf4sUxka8x3SFdSyhFhd8YPr+LfhmUU01yIDHsVeRjju90HH10xZgMZNzedSYyXdTnFBNQ+ilfLDi0vuMih07wHQ8Itr/J1r7T5u7IHHuA3Y4a/jz06n+Tzk49HE1wEaU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567309;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GdODKBTj69CoOEfVAMgHkBpJL6zX0edZTyHBVBanc6s=;
	b=gOnhMWoIL3t/s3bk2OuK8zR2g7QU/mQPu7VufiBE8KlDnGNnhClrFwIvm0nYU9lE
	pimhjKuzvvDM1NFpj8Fmk41YBzXW4ANj6nS2dkVwa+y+jxhC1bOmdjRja0E54gAephV
	FxC+8Yr9YJ105zdezcqLzGWlVr+FDVJ2zUPHyKK9/1306bU4oNPA2SRzJh9Dt8NcIzG
	gxmWUvraMSntvDWTOWQMiXIhIXnEsE0cAyW01WBuY1+Y1xH6YkO03qS+G0j/6e5f6c5
	YzLEIji/yAY78AigzR1nBNzhTt1TNL7r/1D4NV7znRIhLZaovJ5QvSpMLrLP9C7wU7k
	BSJVB8FFiQ==
Received: by mx.zohomail.com with SMTPS id 1772567308326261.20672561756817;
	Tue, 3 Mar 2026 11:48:28 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 5/8] ALSA: usb-audio: Deconflict VID between Focusrite Novation & MV-SILICON
Date: Wed,  4 Mar 2026 03:48:00 +0800
Message-ID: <20260303194805.266158-6-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

MV-SILICON is a SoC manufacturer producing multifunctional audio SoCs.
Many budget-oriented OEM devices are built on top of them. However, some
of them are just too budget-constrained that their manufacturers didn't
even have a USB VID and simply picked a random VID.

Some OEMs unfortunately picked the VID of Focusrite Novation (0x1235),
resulting in VID conflicts as we had defined a VENDOR_FLG() for the
latter.

Add a VENDOR_STRING_FLG() for MV-SILICON to stop the matching procedure
for these quirky devices, so that quirk flags for Focusrite Novation
won't be accidentally applied on them.

Quirky device samples:

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: G1
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 7-1: New USB device found, idVendor=1235, idProduct=0003, bcdDevice= 1.00
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: mvsilicon B1 usb audio
  usb 7-1: Manufacturer: MV-SILICON
  usb 7-1: SerialNumber: 20190808

  usb 1-1.2: New USB device found, idVendor=1235, idProduct=0002, bcdDevice= 1.00
  usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=...
  usb 1-1.2: Product: V8
  usb 1-1.2: Manufacturer: MV-SILICON
  usb 1-1.2: SerialNumber: ...
  * https://github.com/linuxhw/Dmesg/blob/main/Desktop/Others/Intel/Intel%20X79/96ED1CC44499/LINUXMINT-19.3/5.0.0-32-GENERIC/X86_64/5BE1E4C74C#L1122

  usb 2-1.6: New USB device found, idVendor=1235, idProduct=0002, bcdDevice= 1.00
  usb 2-1.6: New USB device strings: Mfr=1, Product=2, SerialNumber=...
  usb 2-1.6: Product: V9
  usb 2-1.6: Manufacturer: MV-SILICON
  usb 2-1.6: SerialNumber: ...
  * https://github.com/linuxhw/Dmesg/blob/main/Desktop/Hewlett-Packard/ProLiant/ProLiant%20ML110%20G6/79B1D707316A/KUBUNTU-21.04/5.11.0-33-GENERIC/X86_64/A43F59C4AB#L1009

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d365eb41910a..00d1a7c2260e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2443,6 +2443,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 
 	/* Vendor and string descriptor matches */
+	VENDOR_STRING_FLG(0x1235, /* Conflict with Focusrite Novation */
+			  "MV-SILICON",
+			  0), /* Stop matching */
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.53.0

