Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550245;
	b=x1CFiYAwdFrS1Mixxpk6ZDLHpIGoq+lymLHpZBxcMMw4HyKFNkMItsOj8NA8766QJDVr
	 h/E+XTN2QAdF7y44tc50s7kFa0ZfKny3YzLMCw7AEx0J5+TmJs2/TdPu1WMwICnX2KYU8
	 /3DnDFE4RS/R5MXJ31XqwT5HTMMSWt+ohkv91bH89lGirJUTSZlpmqy/F8rnnlcRM74uc
	 U1n8UXqidFNh1Wb5+6efvynKAYq3Wg1rCdV4FLtHwuvTTjMClEDbciBuG5xCZR4+Lu7Oi
	 pWB1IhG3Hy9grbHLQ6/Drg5U/cV5pxRFhcw0VnPaq0SIl6CZDOn1Efg1f59l67QcuAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550245;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tjsRfHAMpyvSs74xFOVOQqIbTIQc0o7lGWQgrdJETlk=;
	b=n6m8nq+9hjPdchsvbvm93S3DQndaUjrwTALO97vSkA+fK8ixj2633uep7yDHhfe2l3cg
	 MFQbyyO0JJqULnrot37Z3SDgSBWxwQ9C+j+pUhOJmYYNtvX4aQ6p+YxcvtIpEXLT3Fwd6
	 AyEW9Ogwj5VpHjtXSTIR04It1oPwJna+ugU9fo6jjeyTAYQPvrhUMyRpY9ZRPVNORrLVq
	 HRJYCxCK/sgTsQjrBeuBD7VnrtaHrknX0vVJQvu2lVNKMGUVYSFWl/8wzkAj77RS2zbP3
	 pnGmhkpb3b97qLTBl1Tn9HEE7kNqx9gBOyzjE/yNWbMr+jXXC8ycPIvHX/W4EJciOrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=sxQlW5oj;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA3D606A32D
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA3D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=sxQlW5oj
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795550237;
	bh=tjsRfHAMpyvSs74xFOVOQqIbTIQc0o7lGWQgrdJETlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sxQlW5oj5m49Boj6fRpGimLIlvUlSzDBGZODy8/XCxNZi5Garr00KMsD3hChA79sr
	 wzO0YljCf9mx1NwwupgQTx8BfpK59yBOHJN+lCqssTzeFa7n2ph+cQYDiAm8dMFunA
	 wgTnELvmecIrjP7RC8B3MQstdH0WGgOwu+3fVSkYo6lb/YtcWCC5p+W3gOJylexuZF
	 ZxzFVJq42iE1YcPyR8TluNTsOHQAaUgHrIJKEtm2M3L0da6tXa/04b2L523vGqeN1K
	 S4Iak3tf4XX+1874eZqkVRIAuNypjpnMhL2+6p29LCEk1reVSmjHYUcwlQ0SoWlIIy
	 iINYW+fbe8mQA==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id E876D1BCAE4;
	Tue, 24 Nov 2026 20:57:16 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 1/5] ALSA: hda: Remove orphaned function prototypes from hda_local.h
Date: Tue, 24 Nov 2026 20:57:00 +0100
Message-ID: <20261124195704.41649-2-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124195704.41649-1-amade@asmblr.net>
References: <20261124195704.41649-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

snd_hda_schedule_power_save() was never implemented, and
snd_print_channel_allocation() was renamed to
snd_hdac_print_channel_allocation() in commit bb63f726f98b ("ALSA: hda -
Use snd_hdac namespace prefix for chmap exported APIs"). Remove both
orphaned prototypes from hda_local.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/hda/common/hda_local.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index 8bd4497a6b09..61998cc35a44 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -616,8 +616,6 @@ int snd_hda_get_int_hint(struct hda_codec *codec, const char *key, int *valp)
  * power-management
  */
 
-void snd_hda_schedule_power_save(struct hda_codec *codec);
-
 struct hda_amp_list {
 	hda_nid_t nid;
 	unsigned char dir;
@@ -708,7 +706,6 @@ void snd_hdmi_write_eld_info(struct hdmi_eld *eld,
 #endif
 
 #define SND_PRINT_CHANNEL_ALLOCATION_ADVISED_BUFSIZE 80
-void snd_print_channel_allocation(int spk_alloc, char *buf, int buflen);
 
 void snd_hda_codec_display_power(struct hda_codec *codec, bool enable);
 
-- 
2.56.1

