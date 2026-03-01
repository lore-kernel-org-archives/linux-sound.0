Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C77337BB5;
	Sun,  1 Mar 2026 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401088; cv=pass; b=cw9E351LsM3isPeFmNYNFlSPcYQ3JLAlwlwmeQjaBnhNf3EcA0NJSmZyvbi3OP/PkC6LfE9h0hcTrn88EUtwPVdCJmiH75s3+h2oi2DD2MMPPBYIylnb7y/exXleMyVB8sRGv7Iityy/iKlcTcdNl73dBfWWDycr5IhOWrRHcso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401088; c=relaxed/simple;
	bh=lczvhptfCNDqAj/xQ2IouLznCNoPQjxx9kJs0HqVGa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie3rCb+2GsS9EhkovhRJIiEab+UJdHiuo2Jf7EugfGj/0lA3zfJ/ptish1Yh1wTvRyy57Y20sZDSx8Hd5xuEId3jTtIU/jCWFos4SLBemcT9RQF/86DrXbf0t98O7J38iKMbJuFXCZDiEUYu3B2XrR76TKww6ABrF64oHZHOXG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KSaQXlU2; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KSaQXlU2"
ARC-Seal: i=1; a=rsa-sha256; t=1772401072; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HduUuQmGpxN9hS4l4PVdyqsbx4wtiE7iMPg3cXgV86RaSU61tEPXx7T8owWMd5BfbygkpQnSs2kgnL0F+BYDEvNEtApmjygGvExsajcfHJYGBIcZgJQVJwcRk50c+SEzN3i9BLt8e6vQqCesbf1l2aNRonlcYTAgoVLgMZ12BUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401072; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FfPX+WxmbQTz243CKnnpQci8rBV7QviMzCvuGaRyn40=; 
	b=nKuYVZPl1/PkL9bwbfzGCqGEsWkTVRbDIoE+h5g+3wgM/PrqqYqDAo9XCDTnif8zIGDUqc/AJgds5ksvuNqyGe37EaKZFeda6WBr4j4kp1WJg3AonJ7ftXa6OqNL7NZcQlUlqlAkKwIhex6B/bjaVP4KgRoMxxkp0BAdjpCKWFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401072;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FfPX+WxmbQTz243CKnnpQci8rBV7QviMzCvuGaRyn40=;
	b=KSaQXlU2rquNgz/sPmuLi3hvErBwRnX87817FlHqCgAE9jb/cs6Rap33Nt5LJeJX
	c4MqTegd9154IMLvbPtflBbEv7Ig8kvCsTRKSEyKvLH9vAN7SJu4FtP2lOLphQQwAOl
	d67cxQTP9HrHn0AQtWCvDdXiHZYgVt+I86fvKFnjZ8zPlmvmBITsecCa83LCFceXVk7
	e2WS8RQUvzftSSYlwrBpeT6QGyWENc9VaoVGPy8+CJS5+G7mJCrV4PTy8/DaPIdWwET
	4J/gG7lFEzeUesQA9f8zVK20ESJT6irPvjkPhRDhFOmTNtJeXdh8PXcAkCQSu6tkOdQ
	VetuyDWDaQ==
Received: by mx.zohomail.com with SMTPS id 1772401070492785.438855171703;
	Sun, 1 Mar 2026 13:37:50 -0800 (PST)
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
Subject: [PATCH 5/9] ALSA: usb-audio: Deconflict VID between Focusrite Novation & MV-SILICON
Date: Mon,  2 Mar 2026 05:37:21 +0800
Message-ID: <20260301213726.428505-6-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
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
index 495dd46ce515c..5370bcd99e9d0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2440,6 +2440,9 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 
 	/* Vendor and string descriptor matches */
+	VENDOR_STRING_FLG(0x1235, /* VID conflict with Focusrite Novation */
+			  "MV-SILICON",
+			  0), /* Stop matching */
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.51.0

