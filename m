Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC98733A9D1;
	Sun,  1 Mar 2026 21:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401098; cv=pass; b=OVOmCHu82eiSP2WFYrlZA3VW8FdffoVlsBqNdjJub+uprzsfON3+Ozmrrv4109z2IPQ/VZcQme+6HuoIvEp7LyEj0cH7MH0HLPlfaq4A0AG/uBVn3qWJxZ3TxNSnh93QBM1GSOaGzWXwCDz7CAQPmihPq/xDlXLBQMTVtsvv8sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401098; c=relaxed/simple;
	bh=rTMH0qUdpUYeHAGR3XYd7dD9J2AlOdnDYFIS12f0w3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpwePauSEv/Euk0U9Qp6QCgXi95cIf3OQ3o9VJf9K3tOLxakPqfQ0CbnSGLayQg8ixon1oJW89iIevgFwPxE2Qr0vp27PH8seS0l+7Ij/rpGnrwuD+TkTi3tosYdso5XPhX0ZODx6TzFOIMch/TqsyEoARsqkKpF/yjKtH8PYJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jJqTik4a; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jJqTik4a"
ARC-Seal: i=1; a=rsa-sha256; t=1772401082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iRX572EjkFmIAfLTHLNvT87eevUCYC8FqbI9d47G9/7NT7l75x2WXzVpYaTTaMY3fL4vrgZD3bOb0loWYeesqPaLxwOdRC+MMdiNoi//dhHkbgtlDDZ8pC3N+tYXf/BqYKnZQepxAsMOUIDfUvOX91haRHlAYgaOgikWfvU2wRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401082; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KR3grbK+HY18oMi24XzG2N+wZ4FjkwNc6AKveDdT6L0=; 
	b=ioVJDNgpGa58nCNsIw+gdqoP/gePn8HhcvQzPek3sORoLea5XDSVHYVEQ5wOHAwPCoww9Jb3K6X1dx0LqXF+XiIn7vpTiQX7MD8qCLAoUS6gFBw24tzdr1Z9X2pOSi9TOM6yEWch2eQ331Mn9hMF5cTMZVyGcu1RkFLGIJwvGhA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401082;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KR3grbK+HY18oMi24XzG2N+wZ4FjkwNc6AKveDdT6L0=;
	b=jJqTik4atZ1gSXCahUuVvInclb1WGVLHl7Cjz7yC1iEhsta78eCinH3WaROMYUGz
	FsYfKEI+xTYyK/4GTkM9PGICMQiXZ2PrOzxCtXjAwLyttqAohPtQYJb9jo40rvwuf8B
	w6Ny6HJYS30bdiU8Mvd8bAC5q6/ljwiebzt0xDzYw0IzmvD0Df6w9umZXPLYOBcP0Kg
	3WxB6uNgvb6Mb2BTb6UW+hGwx16JeW/DfZNaBsToZPqzMBWPzR7VDne9X5wdZmlVfki
	iFkdgujswSmmtPjwT4WNvklAgpe2OMI0QVpkkXhipcp9L7b16NxqLccC6bo3qbqmvqL
	B7QtYq93SQ==
Received: by mx.zohomail.com with SMTPS id 1772401080433616.176832505962;
	Sun, 1 Mar 2026 13:38:00 -0800 (PST)
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
Subject: [PATCH 8/9] ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
Date: Mon,  2 Mar 2026 05:37:24 +0800
Message-ID: <20260301213726.428505-9-i@rong.moe>
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

Hotone Audio Pulze Mini is a modeling amplifier with UAC interface. Its
Playback and Capture mixers use linear volume with val = 0/100/1.

Add a quirk table entry matching VID/PID=0x84ef/0x0082 and applying
linear volume quirk flags, so that it can work properly.

Quirky device sample:

  usb 7-1: New USB device found, idVendor=84ef, idProduct=0082, bcdDevice= 1.03
  usb 7-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 7-1: Product: Pulze Mini
  usb 7-1: Manufacturer: Hotone Audio
  usb 7-1: SerialNumber: 20240807

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2327288e2b20f..ec809b7eb5bea 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2438,6 +2438,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
+		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 
 	/* Vendor and string descriptor matches */
 	VENDOR_STRING_FLG(0x1235, /* VID conflict with Focusrite Novation */
-- 
2.51.0

