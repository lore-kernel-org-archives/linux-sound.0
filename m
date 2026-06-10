Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D811CBA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 04:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781065079; cv=none; b=fmTOaPoBQ5WYAyzxTzavQWcM+ag9QjLkLCNlVXr5UtTUIND263QUyant+qiDbvHVlNhgMwaLb/WahqZh0Hh8caNAUiv998bepxdYvE1NJ1yq98ebXEvAmVX5AIqyh0AwfFWAkvGEmGuzX4qopWMCm0MPISYqvUT6xIfnIz2v3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781065079; c=relaxed/simple;
	bh=2k/7sVBsf+036mIuV/evv1onTSm6IZDrTWZzB/8ZS6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z33zM0bRvYXVe3vNWDQfKYUb6YQ8byUG5F9pKU8MGUaivWvajWWcKpmTK3hDFg5hPxxMfVUNyeUVxjD969K4R8/DqUMCw6FbK6k+DtxnE0onWt4RMUJsesAyBkLVRogLMLG4RAamD/UDh3gQ+1A0ni+/wuMs3c88MICbw0ptFpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LA+cXjyb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LA+cXjyb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84230ab8857so2820954b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 21:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781065077; x=1781669877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=48HoSBf/AJje2YmExI6mWMusXIAF8pqpZlQKPjet+g0=;
        b=LA+cXjybdcXExVg1vLHbLMKYbfQGDCdsE20HBFYNzbSwUhziAAoSFZrSCepmRAtFvV
         R29qmNdApv39GvNIAVBiSVPvdZyqa9sTfgELtbSXUIdxT9PkerOMQNBtEp89MKTyrVeO
         lWYmOsChDrGVYlcdssqcITmSUiMQgsL33MY89jtng8Qb+zLVNPCkGzTrewyjwInHbQX1
         WkQrVkttCGDhnti6L055Ob11vKRn2IBtcBgYPiJubeNutbd86CWofM8Q97TsWXWMUtkC
         Yj8qoki3Dj4WV9fbi0QiuUBfYeG9Hq5owYosWTulcqqdPB8hOkmr9uSfHRlGG+urV5l/
         OtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781065077; x=1781669877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48HoSBf/AJje2YmExI6mWMusXIAF8pqpZlQKPjet+g0=;
        b=hOq29lD9Dto2934zwojA843ziz+/REivXVF+8uRPY3PHX677pdigLLF5zXVJ/j/IUd
         7c0uIQDfm7ottiRXkUAF/BRiC9g+Uv9Cr18lQG8Ob4uYNtU4uySlkjWvErimj8k01TNA
         ouaqTsqj+L8zswSoBQwzK6OGhekWOJuQo9IjOrdf41Jlve3ZXGt2ldBKk/kC0wm8+FQ1
         vaKkvqj3W2B6wVdbzxJtfjh+BrSjhddxV8gWowymSfeo7TV7u25qg9y0CXeR6NUDgRVA
         lM2Ik2OVFBge+g1CzskGaEh5Ri7MyRvq0tt1M4WcmaUW46L7i2tUVFCktUpDji2gunYN
         TGCg==
X-Gm-Message-State: AOJu0YzvJLWSCNpDdpssbUwO65krL9sWfYF1wR/3u3IN6GTtSlT7pOL0
	g9O/d85GjesAaDHYqgldyBbrCdHbWICHN1UP9lMPk0DYAe2MC/ZOFBcC
X-Gm-Gg: Acq92OH6OjAH5TURpYiNVpFwE/Zf1LHHwwlDmTDbevBN+pEx0PLNzE0b2ztEqoEg481
	dggTVIAaFAN3Me0Wua9dqOloyHTnhafP3Sa3h6KkK8OxDs27ZHf+arLWQpsPv9e2stnWMVUohNI
	UMQ2otfPAYsfRG2BuHFvrcEvmP2qc+oduYnNeqdoUPB292BL6OnsW+EQb807gQM+tqlC0wjxUXf
	r/7QnCjI77polkAmx3HHUeVPctauhI4A/MlxXsYN1R5RfJFz84KPCBMRNHJ+y7iwNxFdqKQOevG
	dup6atRffU66mTenMvk5af6DiUpn2eZRP+zEOg1UOyL+M0NHA7Y+DPcawzoeDseiuelHWFVYh1C
	Vi6RloBCt+9mDNbFN82W2SjaDfTLqfyVUBzDAcudbRQhXzsY3/KqmKFfMZ7bfCXAE3G75diJQHV
	GdgABSi7w328UC6tA3gC2pafbGyJYBrxckr64TY+htFcsmQY52O7Bxzg9mt3yQ46M=
X-Received: by 2002:a05:6a00:1bc5:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-842b0e2436emr25697840b3a.8.1781065077290;
        Tue, 09 Jun 2026 21:17:57 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm23719261b3a.59.2026.06.09.21.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 21:17:56 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Shuming Fan <shumingf@realtek.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mac Chiang <mac.chiang@intel.corp-partner.google.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Miaoqian Lin <linmq006@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B
Date: Wed, 10 Jun 2026 12:17:53 +0800
Message-ID: <20260610041753.1151088-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit 87a3f5c8ac20 ("ASoC: sdw_utils: cs42l43: allow spk component names
to be combined") moved spk:cs42l43-spk generation from rtd_init() into
the asoc_sdw_rtd_init() generic path by adding component_name to
codec_info_list entries. However, only the 0x4243 cs42l43 entry was
updated; the 0x2A3B entry (vendor_id 0x01fa, Cirrus Logic cs42l43 with
sidecar bridge) was missed.

Without component_name on the 0x2A3B dp6 DAI, asoc_sdw_rtd_init() never
accumulates spk_components and never appends 'spk:cs42l43-spk' (or its
sidecar alias 'spk:cs35l56-bridge') to card->components. The sof-soundwire
UCM regex ' spk:([a-z0-9]+...)' then fails to match, causing WirePlumber
to mark all HiFi profiles as unavailable=no and fall back to the Off
profile — resulting in Dummy Output in GNOME.

The existing sidecar redirect in asoc_sdw_rtd_init() already handles the
SOC_SDW_SIDECAR_AMPS case: when component_name is 'cs42l43-spk' and
sidecar amps are active, it substitutes 'cs35l56-bridge' into
card->components, which matches the existing cs35l56-bridge.conf UCM file.

Fixes: 87a3f5c8ac20 ("ASoC: sdw_utils: cs42l43: allow spk component names to be combined")
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 681452bb89f2b..3c3e7c89e976f 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -969,6 +969,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.codec_name = "cs42l43-codec",
+				.component_name = "cs42l43-spk",
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-- 
2.53.0

