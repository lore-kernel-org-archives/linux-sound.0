Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028560;
	b=Wth6co1P4pFhPI5i59XS3l7uk/bq2gpKuPEvpDhu9kSEz9S1QbKXxSfOQyJhkLlUP2y/
	 BlbS+MM8cpZIE72oFEr1lnUb8HW5cOuN8aZ7IqkKfwQ8S+emwHGePLV4BjLmnqOFAKdut
	 Ah3mbyH0DM+8Bn2+djlHU8ZNkHJYewicE/BY3qY3iq9i02gq3oHkCdiL6M1RxP05xT+on
	 sxUeQqQw03xjqti6Mm0jIIw7ybFNp0yNSU/XpR39/3cBM9z3QfLuhRDl4uZ+U+viE07Ng
	 eKyBKzLIO6ynEjimCZe1fwnQ8ULgdirNyIJBlKbwVG36gqRoRAlMV2OGZkTEZTB8YDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028560;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qV5QzzcKrpeMP009ahUWr3Zz3pDgbA664mg1KU/hbAs=;
	b=W7gHBa4h1RtzNz/0JB0B+9/eqUY5n+GCMEuTzD5nTx/86HqR+Jjr+jAdoW4v9cGFCFTh
	 PK1ERA//29HX49GJ4crSfLrzRx96ObLH+4Xetk03F3Yy/oOvcFH5PcqngFgJCJdg1KLOC
	 rLNpVLChDrB6DOyrdkZDJmY3UzrwLRobf7I3PRT9LsnOlgGj5A27g88RXWu3ZF0PmBuHA
	 Z1A4nRmi4TVKggdbqUTPDJHh52WShVhuvppBGWzkjdjxeSPm+sdravqggChzY6azgpfeR
	 PC0B7gc0cC1KKGaWjgkNW9PEqFTH0hZfWsGRlnWL7WJswi79HG02BSJMs0HBGsHS9DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b="q/vALpIx";
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB75606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=q/vALpIx
X-Virus-Scanned: by amavisd-new using ClamAV (3)
X-Spam-Flag: NO
X-Spam-Score: 3.401
X-Spam-Level: ***
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028550;
	bh=qV5QzzcKrpeMP009ahUWr3Zz3pDgbA664mg1KU/hbAs=;
	h=From:To:Cc:Subject:Date;
	b=q/vALpIxQtFl+YucmlYn53/4j00qidPcQawLrHCFesWbxzeS+yikVFknDTJylE7mH
	 K0AYmjJ8PXcJi4i1YShxHEyn6ZnPQm/i9YyWLyoTWRbUOVPguHv17vQPKov7Y3HITz
	 DiDFPP6S7a0xRDI6llXsxO68imdD34TSjfC7kEqELBc11ZEIgl7TtVpLLcaVyUHGgg
	 S71dtfytArVonKbtTYtwBadxB/KvBgUs0093UTRHEjhS9mqU4B0L+3tyuaRtwp4w0b
	 I6jwao9Ebc+Av9u45tbVnwTzZ6HLzxCzE/ffCVPLBJ6v+FhcO3EK8AoJ71Qt+m//51
	 JCJ9whwNlzFbQ==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id A18E61BE3BB;
	Wed, 18 Nov 2026 20:02:30 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 00/22] ASoC: Remove orphaned prototypes
Date: Wed, 18 Nov 2026 20:01:57 +0100
Message-ID: <20261118190219.316811-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
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

Some of the ASoC code either either declares functions that were never
implemented or at some point were removed leaving orphaned declarations.

Clean up by removing them. Build tested with make allyesconfig.

Amadeusz Sławiński (22):
  ASoC: soc-dai: Remove orphaned DAI suspend/resume prototypes
  ASoC: cs48l32: Remove orphaned function prototypes
  ASoC: pcm3060: Remove orphaned pcm3060_remove() prototype
  ASoC: rt5682: Remove orphaned rt5682_register_component() prototype
  ASoC: codecs: rt700: Remove orphaned declarations from rt700.h
  ASoC: codecs: rt711: Remove orphaned declarations from rt711.h
  ASoC: rt711-sdca: Remove orphaned rt711_sdca_jack_detect() prototype
  ASoC: rt712-sdca: Remove orphaned rt712_sdca_jack_detect() prototype
  ASoC: rt722-sdca: Remove orphaned rt722_sdca_jack_detect() prototype
  ASoC: codecs: pm4125: Remove orphaned SoundWire helper declarations
  ASoC: codecs: wcd937x: Remove orphaned SoundWire helper declarations
  ASoC: SOF: ops: Remove orphaned snd_sof_dsp_register_poll() prototype
  ASoC: SOF: Remove orphaned function prototypes from sof-audio.h
  ASoC: SOF: Intel: hda: Remove orphaned hda_dsp_ipc_cmd_done()
    prototype
  ASoC: Intel: avs: Remove orphaned avs_parse_sched_cfg() prototype
  ASoC: Intel: atom: Remove orphaned function prototypes from sst.h
  ASoC: mediatek: mt8192: Remove orphaned DAI registration prototypes
  ASoC: mediatek: mt8196: Remove orphaned mt8196_dai_set_priv()
    prototype
  ASoC: mediatek: mt8365: Remove orphaned mt8365_dai_tdm_register()
    prototype
  ASoC: qcom: qdsp6: Remove orphaned
    audioreach_map_memory_position_buffer() prototype
  ASoC: rsnd: Remove orphaned function prototypes from rsnd.h
  ASoC: ux500: Remove orphaned ux500_msp_dai_set_data_delay() prototype

 include/sound/soc-dai.h                       |  2 --
 sound/soc/codecs/cs48l32.h                    |  4 ----
 sound/soc/codecs/pcm3060.h                    |  1 -
 sound/soc/codecs/pm4125.h                     | 16 ---------------
 sound/soc/codecs/rt5682.h                     |  1 -
 sound/soc/codecs/rt700.h                      |  3 ---
 sound/soc/codecs/rt711-sdca.h                 |  1 -
 sound/soc/codecs/rt711.h                      |  3 ---
 sound/soc/codecs/rt712-sdca.h                 |  1 -
 sound/soc/codecs/rt722-sdca.h                 |  1 -
 sound/soc/codecs/wcd937x.h                    | 20 -------------------
 sound/soc/intel/atom/sst/sst.h                | 10 ----------
 sound/soc/intel/avs/avs.h                     |  2 --
 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  2 --
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  2 --
 sound/soc/mediatek/mt8365/mt8365-afe-common.h |  2 --
 sound/soc/qcom/qdsp6/audioreach.h             |  1 -
 sound/soc/renesas/rcar/rsnd.h                 |  5 -----
 sound/soc/sof/intel/hda.h                     |  1 -
 sound/soc/sof/ops.h                           |  4 ----
 sound/soc/sof/sof-audio.h                     | 11 ----------
 sound/soc/ux500/ux500_msp_dai.h               |  2 --
 22 files changed, 95 deletions(-)


base-commit: e2aee84df35aeadadfbcdb750a3921a0cab03e46
-- 
2.56.1

