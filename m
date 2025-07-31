Received: from omr001.pc5.atmailcloud.com (omr001.pc5.atmailcloud.com [103.150.252.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F022198E81
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 05:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753938601; cv=none; b=Sxkd9g9bzAxbYnufMVcW9G3H062loCECmwo0O56qibyWW0wRIAhzhOT9hr8k0Exe6f6Ko5yTD8Dhj+fNxc37mkRN7YvRqToUB1+wCdx51VFcVQZ6q1oLF2G/aVv27ReZ4htmhhkJRGdo1DOrhnKTBHd2zPPR2xWidpukNHvC5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753938601; c=relaxed/simple;
	bh=dw3L9ISB+wRsA6egIAjTyW4eMPPePqsCydCTJXRRdkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCYKWUOCtZiCUKrr9dMnNxNMNyCaZaPWcPbOz5B7HoVnAg2EPz9G124E/BqdIDMeoAONSyVnNP2lDxZIrQ8vj+ZrlOOCLF26lsuG0kzyuzBClz2nXhCxxPcomKGwBLNgePHgvY99BAD47LBAQiM9hwwegW+n+z31Iwonzje59NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net; spf=pass smtp.mailfrom=internode.on.net; dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b=DwHPGCzF; arc=none smtp.client-ip=103.150.252.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=internode.on.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=internode.on.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=internode.on.net header.i=@internode.on.net header.b="DwHPGCzF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=internode.on.net; s=202309; h=MIME-Version:Message-ID:Date:Subject:To:From:
	content-type; bh=Gm1zpNJRfleidMS1QWionmV5CGLfyHsYJUslDSMfaPI=; b=DwHPGCzFQVuY
	pM5Y1W7sKg0aapUC7bh0e4aup9UfN1XdGilYveKfOEVJZjY1AcQsDSYVthq8ptPCNPtc3SVsvfozv
	nGm41FwilcFCnAwMPNayISHOBdV0bWrk70WupGlRCyiEyHBIJOAGzMoYT/wE64mgkg6NV0TRPElXl
	JtGJQLy0XtPVzmDbJQ6iqO+9otmAyIvKsPGKn1MnN0OktBFkh6y9X6QEG2rWPW1QxthcLll3wcHDI
	Bea6kvGiElwT7p3A0h4JTjrwgGD+oovf1j5F7cU9ME8HGL0A/ilwrEUrR4jQr47RGeHFUudB4myDd
	AfXbi5K8VDgDy0PvOoj3BQ==;
Received: from cmr-kakadu01.internal.pc5.atmailcloud.com (cmr-kakadu01.internal.pc5.atmailcloud.com [192.168.1.3]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu01.i-0e63219b9832690f5) with ESMTPS
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhJqu-0000000086j-44r0 ;
	Thu, 31 Jul 2025 03:21:08 +0000
Received: from  (localhost [14.2.105.157]) 
	by cmr-kakadu01.internal.pc5.atmailcloud.com (Exim/localhost) with ESMTPSA
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhJqr-0000000007F-3WH8 ;
	Thu, 31 Jul 2025 03:21:08 +0000
Received: from amarsh04 by localhost with local (Exim 4.98.2)
	(envelope-from <arthur.marsh@internode.on.net>)
	id 1uhJql-000000001Es-2t0W;
	Thu, 31 Jul 2025 12:50:59 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: tiwai@suse.de
Cc: amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com
Subject: ALC887-VD line-in not visible
Date: Thu, 31 Jul 2025 12:50:57 +0930
Message-ID: <20250731032059.4750-1-user@am64>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-12-tiwai@suse.de>
References: <20250709160434.1859-12-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Atmail-Id: arthur.marsh@internode.on.net
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=B8K/0vtM c=1 sm=1 tr=0 ts=688ae124 a=OuAXCDeWEIhuZeJxW2dRvw==:117 a=OuAXCDeWEIhuZeJxW2dRvw==:17 a=Wb1JkmetP80A:10 a=x7bEGLp0ZPQA:10 a=ZWTVfbmrPR8A:10 a=fjHK62D-1Rs3iuvkDZMA:9
X-Cm-Envelope: MS4xfKHrzuq/ET/42vlXLzLyU3br56B3imP5FvY9eTTzpb/YC3Qvbv9MG7TA9B7/cMPfFuurVoDNLIJ52aCxxJzzixe6FWjkXkHyehXFk1whaEyDCJzn7y/Q ehdKd6/MdoBka1E73CYKNwUeZQkP0Op5rrPP9R/3q+L+Bg4BtPswAKDKiQqxB6rfzPItWlCY8QSSvw==
X-atmailcloud-route: unknown

Earlier this year I could use line-in on an Asus PRIME B350M-A motherboard,
with dmesg reporting:

 snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC887-VD: line_outs=1 (0x14/
0x0/0x0/0x0/0x0) type:line
 snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
 snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
 snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
 snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x11/0x0
 snd_hda_codec_realtek hdaudioC0D0:    inputs:
 snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
 snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
 snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
 input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:08:00
.6/sound/card0/input6
 input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:08:0
0.6/sound/card0/input7
 input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:08:00.6/s
ound/card0/input8
 input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:08.1/0000:08:00
.6/sound/card0/input9
 input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/000
0:08:00.6/sound/card0/input10

After the post-6.16 updates, I now get:

 snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: line_o
uts=1 (0x14/0x0/0x0/0x0/0x0) type:line
 snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0
/0x0/0x0)
 snd_hda_codec_generic hdaudioC0D0:    hp_outs=1 (0x1b/0x0/0x0/0x0
/0x0)
 snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
 snd_hda_codec_generic hdaudioC0D0:    dig-out=0x11/0x0
 snd_hda_codec_generic hdaudioC0D0:    inputs:
 snd_hda_codec_generic hdaudioC0D0:      Rear Mic=0x18
 snd_hda_codec_generic hdaudioC0D0:      Front Mic=0x19
 snd_hda_codec_generic hdaudioC0D0:      Line=0x1a
 input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:0
8.1/0000:08:00.6/sound/card0/input6
 input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:
08.1/0000:08:00.6/sound/card0/input7
 input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/
0000:08:00.6/sound/card0/input8
 input: HD-Audio Generic Line Out as /devices/pci0000:00/0000:00:0
8.1/0000:08:00.6/sound/card0/input9
 input: HD-Audio Generic Front Headphone as /devices/pci0000:00/00
00:00:08.1/0000:08:00.6/sound/card0/input10

lspci reports:

  lspci -v -s 0000:08:00.1
08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Radeon High Definition Audio Controller
        Subsystem: ASUSTeK Computer Inc. Device 8809
        Flags: bus master, fast devsel, latency 0, IRQ 87, IOMMU group 11
        Memory at fca88000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Legacy Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel


When using alsamixer, in the former case, I would get a "loopback" device, 
which when un-muted would enable line-in to work.

With the current git head kernel, I get no such loopback device and have been
unable to get audio via line input.

Any suggestions welcome.

