Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4325DCE0
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195860; cv=none; b=fZwuTUglLUbc3d9cjDS8CiDXpEYqy4h9fA623DUPWFThyHDvzU7j6pjJudp31ZKUyr6mxTEIux5SiqKdtpRARIMLu76SHgFGE9yxD5q2Da0aQZ8EMbT9oCw21ZR9NIB6/XQY31OqG6Vxpegu7iBo/GZpXJkpKIMWEvhAOWZ+vPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195860; c=relaxed/simple;
	bh=9pmlo3y5/4VGmU6ZyeKvsRxtyqRaqYJlB0yozqK/4jM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KAaFODqYeeIouKv+bUhCNdxRGP78tA44XgWjj/APbgF5S+90yNU47xPHMPFTlXmT7wRj6VrAehkT2gt4JrwP2+tKkIC9G1R1ATkgtDkvxS92r+9pmXyqfBCIGUySzjmOW/gEiicJfKs76V6YKwJnyfSr+EzxmZSqgiLkdX63EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=actnbfVp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="actnbfVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195858; x=1775731858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9pmlo3y5/4VGmU6ZyeKvsRxtyqRaqYJlB0yozqK/4jM=;
  b=actnbfVpX9Sjv+3YGWaU2DdQh8fpd2l8EKfdw5oGypLCXu6ewT2I6NW3
   nNX8V6KBbN5ylxg7kBcZhZ/PZrtQp79q4CLc/liel1hfWOoGCK+6aMHlt
   U0UgAgFGkg26SuOONR01DOR2J350/gQNj111Y/PP9MWADHJspimvp33lY
   WlMQoIBmk1l8tIinV8S0bnhgrseF8FLBahScgp6AZhJvuEqPWrs5M6VJf
   U6zmo9Q/HBt/SmilLrlpGOqh+SWiglbI6Jdw8NteJkOMgNiZyDKzq+X/6
   eYtBuYRlJ3BTRBaIb73sE3C/b/WWKDm8CBjJb2ohKwaDnVVdBNtjHTYRL
   Q==;
X-CSE-ConnectionGUID: qfqR1t6wT+Owi2DKyxsOjg==
X-CSE-MsgGUID: MWV+OMEDSUeIOtYFtgTVbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380015"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:50:58 -0700
X-CSE-ConnectionGUID: PUtMS0b6SwK5unGVJYpk7Q==
X-CSE-MsgGUID: fhuM1yDDReuwHtJAqwmkPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426178"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:50:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 01/15] ALSA: usb: Move media-filters to the media code
Date: Wed,  9 Apr 2025 13:07:16 +0200
Message-Id: <20250409110731.3752332-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creating and deleting process of media devices in the common code can
be simplified if quirk_flags are checked in callee.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/card.c  | 13 +++----------
 sound/usb/media.c |  6 ++++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9c411b82a218..03694295491f 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -909,10 +909,8 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (err < 0)
 		goto __error_no_register;
 
-	if (chip->quirk_flags & QUIRK_FLAG_SHARE_MEDIA_DEVICE) {
-		/* don't want to fail when snd_media_device_create() fails */
-		snd_media_device_create(chip, intf);
-	}
+	/* don't want to fail when snd_media_device_create() fails */
+	snd_media_device_create(chip, intf);
 
 	if (quirk)
 		chip->quirk_type = quirk->type;
@@ -983,12 +981,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 			snd_usbmidi_disconnect(p);
 		}
 		snd_usb_midi_v2_disconnect_all(chip);
-		/*
-		 * Nice to check quirk && quirk->shares_media_device and
-		 * then call the snd_media_device_delete(). Don't have
-		 * access to the quirk here. snd_media_device_delete()
-		 * accesses mixer_list
-		 */
+		 /* snd_media_device_delete() accesses mixer_list */
 		snd_media_device_delete(chip);
 
 		/* release mixer resources */
diff --git a/sound/usb/media.c b/sound/usb/media.c
index d48db6f3ae65..b175fa820345 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -258,6 +258,9 @@ int snd_media_device_create(struct snd_usb_audio *chip,
 	struct usb_device *usbdev = interface_to_usbdev(iface);
 	int ret = 0;
 
+	if (!(chip->quirk_flags & QUIRK_FLAG_SHARE_MEDIA_DEVICE))
+		return 0;
+
 	/* usb-audio driver is probed for each usb interface, and
 	 * there are multiple interfaces per device. Avoid calling
 	 * media_device_usb_allocate() each time usb_audio_probe()
@@ -312,6 +315,9 @@ void snd_media_device_delete(struct snd_usb_audio *chip)
 	struct media_device *mdev = chip->media_dev;
 	struct snd_usb_stream *stream;
 
+	if (!(chip->quirk_flags & QUIRK_FLAG_SHARE_MEDIA_DEVICE))
+		return;
+
 	/* release resources */
 	list_for_each_entry(stream, &chip->pcm_list, list) {
 		snd_media_stream_delete(&stream->substream[0]);
-- 
2.25.1

