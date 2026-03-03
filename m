Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14437390CAB;
	Tue,  3 Mar 2026 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567331; cv=pass; b=Nm71gYuXr0NDStbE46YymDjM11HSj6FsRHxWZCbgY0qvx04QSxOScLnqIVoHQmuDS8mJTWiId3AKa4/js4X/WPMosLl+slsO4qvJeW8d2hNhkvhv8GuhPXEnnZPtSlVogQAn/DAv6QXekxIm53zzjqpunDg2nRv8iuXgoXpTbZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567331; c=relaxed/simple;
	bh=+aoBBw0QAYw/VgMz6vdFpjOKSBM3Sq5nzN/0DB0JSZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PT92mWwfVpUcnUgOFvUUn/H1IPyylIibwn1QFgrkD0JM1NDmylKRMp/2H4rc523BUko2gJmcPpp1pUXGZ3MpSI5s4IbNidLHFeQI+LbVWNr2EMu+zgwlY7ocwK84J6oWyDYBq4L4ghVV+PqfhEtJPHBweuYk2rtfn4x96Nx7A2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=b80oSsBn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="b80oSsBn"
ARC-Seal: i=1; a=rsa-sha256; t=1772567317; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FhLxnO4OPCYdWDVmVoZtc4giOyRdEVFrYUy3zbGnE/H/XCJMD2CXVToSicpMC9cKQVdBcwgwH1gKrsi7klQ7iWMwwdqGXmfO9MCYHih854XVYa0wLAnibT1HOtq12lF7IhAyo8eghj8k3MLy7pSOn1jVMzPEGPB6RbSjGz+AIuI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567317; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dcL1ZYaSNXXOVvluiLbCfveAHnn1GXtTsMNzhPO8ZVI=; 
	b=NYTLPLBFNC3AwZ9p+sHq2sby7oMY9AQU8JqBV7jX+sNyPOt+7dy0VAkgkhij4LGbTrWJy3y7zu0ykUkfurds0aN0KV/IyEtm20zMTEIZTryMwLZrroCty8PiLua9LvxFGdB95xIVoS66JjpBwknSelHSsL4Rahz+dTHDBrEw/H0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567317;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dcL1ZYaSNXXOVvluiLbCfveAHnn1GXtTsMNzhPO8ZVI=;
	b=b80oSsBnf9ufNrDeDzc5eTMg6HEW/4uig/Ojd53rIGE1+zQotpRym4cy2mtzoQCu
	e6N1rtosfpN/77S3Wwbw0M7lsLEQElxD67CHdMf+0vZLBCMB4LqPEW4su8o+Ueo0HHA
	0oM2SCye08JrGaNkgYEIUbZKROvDyApf48QJ9iyUJxLTARJuzPsamP2G5LyAA0wHOu/
	nz2nhFIy0NLhLtEukmuD78eMgxTOOENNYjtLt3rz59iC+iboC0lUuh8Tcu0UkXdO9SB
	RGjEc3bxLhhd1NuiDKkbfdqDlhxbDUPm+FER+TyJ/4NdeSJ0Uf2DlSfyOLkZ0y+eR5K
	11FYvaAWQw==
Received: by mx.zohomail.com with SMTPS id 1772567314904489.6854365407455;
	Tue, 3 Mar 2026 11:48:34 -0800 (PST)
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
Subject: [PATCH v3 7/8] ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
Date: Wed,  4 Mar 2026 03:48:02 +0800
Message-ID: <20260303194805.266158-8-i@rong.moe>
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
index 7a5cec9cc4bd..17f6be4d2350 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2441,6 +2441,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
+		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL),
 
 	/* Vendor and string descriptor matches */
 	VENDOR_STRING_FLG(0x1235, /* Conflict with Focusrite Novation */
-- 
2.53.0

