Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631852;
	b=LUlkA2a+m9OkfqQQYnCZb1xIRTTQg0nD98b7lTHYHUW+jL5zq3TejV8Pt/XKgO/Uz7Fv
	 hFy+rwyp22X0cKTh+I74Mu0TXmM+UGgWh6lEs58GFBCJKZUrXi5l/dxmOjlNv9Oh4tqVQ
	 TSh1VxSPoBjTK/mMuvXpy93eobtesWCAFHDhgi4gUc3ttAFtzDZAKmFcV6bG/Lp3mATZu
	 AEbTdMyoCYi2j89YRfr404cmXspy+ZZyjIDY+inPtZ4zAGN2ZQL3R3ZnrjK8+eKj72rkX
	 2nfpqdlO1HhF+0a0ceE8Atinwj3+Khg7yR2QOVML534nn/0rg7yROXKcXONR3bTGJNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
	b=dmFTF302yB7apHI6vR5oGARMXzerfEpJ45vE6dhIioN3+Neh5Xe9H3Um3VAx4BW24Fe0
	 uDG7Gu4KbhBf63SLhx5o1QnObUAhKrEerQUSEZuYf+lewQD8FFqv+jGwk6bXAw/O3W572
	 jCay1Hpcm2050IQIgwodgtIQaOcUV7nZNRI5Zmz7Xwl00PNTUNcXGKTIKQwaUYWhqi3kD
	 8ZHfvV3U/ZARIcdFq7TcAFDUwF6NHQy5Zuf/ihCLy/vwGgNYfVYmoey90UCpsUKM55pyz
	 UEotJdLzSwrMDaLInLAT6YC1deuaXuSOPn9IBYAo7Qgymt62eh7LGxQxF3RznUxkXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwaW9uHL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5471606A326
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 18:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5471606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwaW9uHL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso33337475e9.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631850; x=1796236650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
        b=NwaW9uHLhWDz1JQvFv1IoKf+QK7th0438JBfB6b5Jik8GN/zO/xJ+nEvvKuNrdtrqB
         RR6nofnnAOr3IgswVFRX0rEgBLgBnqxI/a5U4xKLHH7LfsWuZk6249L1jexDWFmgeeLc
         ytBbeYkm70OAs7Hbq5eQdFf1hQibJCo4+fEZQyMzb4/QbUIcv1UXeteUdyC4NitCbFIM
         BNj1P/OGAsAriCzgyyTLGSn1Ghaft1uiBmomA5hwUZDED0+gkuaVcwQcmpBmyCyts7gR
         CU8EocwDmH/8a5D5qne1KevXtlJ9uQim6yjDMNCm7cHUxVTtoWcaEmfg2EvAS2aS00Wp
         KhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631850; x=1796236650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kek6FDZpLqcH0HSvQN9yDKp87EpQtRAbPNHn0j20kgA=;
        b=1LAR+VnbcS+0jbt6eimSVo6pCWnfRSqToGAhx3OWdiF/efA805oP63QzUsyUvIvh5A
         O68RgFrFevtgb8aE7bEl8YSB2ksfVChC9wL8VotYijUi9jdENWp8MU8683GIG1TGaoZ3
         k2pS97OXAKDtcobJxU4sluI4L165+2zHSKOGNbDA0mnlqwyR03sx/+kltjVbRIcJ1Qfx
         ToaxGSnQDXYEO+xFU8nubYncAcsLvYwM9YycOz4YU/5IL55CcekFtcFqpKuPkF3CvEZN
         Pft+N7dM9Zb8Ynb0fQBrDwxPFXT52V2IIpmIXwxJjZuLuBtlEKbRXPva3bjW4+2dwr/h
         48ow==
X-Forwarded-Encrypted: i=1; AL+hErFbDCEEu6hl6eolU7VyrHC7LgXwjrQkyxQ+boGRKLdUryDwiIUcZiTGlNXYiA80stByAMSs0Bz1gsVNSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bnOacUkVfzM9/7J8JW4elf78/FEB2HIzhOFiZaChnIpsTSjAJ
	x0TxMbiPdSaqnIlhmtUl9H0J3sqYsTOCExRK/SGANMqISI0+orIvC7PE
X-Gm-Gg: AZFdTZfegcRDSzpz28PhvDkPKdz6f/J420vYcvikZmA4/o+6d4+X3eS24wggY2JUPxv
	sUQ+lhq0ZQwSq5cGNEjDUtWRRguqBvrw7D6M8Qn6MFQsyr9JFTP6Qvg6bSfL/eD7y3LfMIMMwpp
	ejANkD0o22e56JfMJX3YcTK5KKZV3V01DbLlKGOK/CaCOCGuL4fo1pCQX9+1Khm1r2DgAm5Miqp
	bHWZv04cjG+8wvMHo54zRZOzZdiRbc+7sYqyNzDyqUgbtIresGYrQMDvQtM9BtO+Et8wtJeABPF
	9zQrvlEOydsMQLbhoZna+L665UAauPVZBAIDkPKPdDi3CsdcBV+RnwX11pZvPrZxDfFUTm43YyL
	xraDlg7jp9WHU7FWrWXV2ta5Zw2HcqnlRlVoiUqtgIEP7iIoIxdTNRy8LCkjZeatkuQ84e3z2QQ
	zeH8UcqAzMvQ27B3jBNvoQuT360msGscbml4nUIifcPgi5D0/DqzSezPBGOMgLAmwK+54StSliu
	E9iUlKJvqLPRNxFxmySP1pcO7BNaE07Nx8jv9BEbmb1jCNFhgVWJr9xiDxBIZOAs83wC2YEkUaS
	ol2rzHyzBh07sLbcsBElxeA9GvI5juAt5oC1YUue8Szj1S2uZmrcBlOiSnAy8XfTJwNzqIudXlu
	47Q==
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr384863025e9.26.1795631850007;
        Wed, 25 Nov 2026 10:37:30 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm68397895e9.3.2026.11.25.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:29 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with SND_INTEL_DSP_CONFIG=m
Date: Wed, 25 Nov 2026 19:37:06 +0100
Message-ID: <20261125183706.53331-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

Just to bring this to your attention.

snd-sof can be built into vmlinux while the Intel NHLT code that
ipc4-topology.c calls is in a module, and then the link fails:

  ipc4-topology.c:(.text+0x22bc): undefined reference to
    `intel_nhlt_get_endpoint_blob'
  ipc4-topology.c:(.text+0x2424): undefined reference to
    `intel_nhlt_ssp_device_type'

This happens with a non-Intel SOF platform built in and the Intel option
modular, for example SND_SOC_SOF_IMX_COMMON=y selecting SND_SOC_SOF while
SND_SOC_SOF_INTEL_COMMON=m selects SND_INTEL_DSP_CONFIG=m.

The existing guard cannot prevent it.  intel-nhlt.o is shipped by
SND_INTEL_DSP_CONFIG, but the guard tests SND_INTEL_NHLT, a bool that
SND_INTEL_DSP_CONFIG selects "if ACPI", and a select from an m-valued
symbol sets a bool to y.  So SND_INTEL_NHLT is y whenever the provider is
y or m, and the condition can only tell "NHLT present somewhere" from
"absent", never built-in from modular.  The static inline fallbacks in
include/sound/intel-nhlt.h are keyed on the same condition and are
therefore unreachable too.

Test reachability of the option that actually ships the code instead.  No
header change is needed: the file already stubs
snd_sof_get_nhlt_endpoint_data() in its own #else branch, and wherever
IS_REACHABLE is true with ACPI=y, SND_INTEL_NHLT is y as well, so the real
declarations are in scope.

This is the same remedy as commit 8a3fea95fab1 ("ASoC: SOF:
SND_INTEL_DSP_CONFIG dependency") applied for snd_intel_dsp_driver_probe in
sof-pci-dev.c, which commit 194fe0fc3422 ("ASoC: SOF: pci: move DSP_CONFIG
use to platform-specific drivers") later resolved by moving that call to
Intel-specific code.  Moving these calls likewise would be the complete
fix so this is the one-line one.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: aa84ffb72158 ("ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's")
Link: https://lore.kernel.org/r/20261107114944.561731-1-jude.gyimah87@gmail.com
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 22c15fbb93f2..3ad27c57564b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1790,7 +1790,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	}
 }
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
+#if IS_ENABLED(CONFIG_ACPI) && IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)
 static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 					int *sample_rate, int *channel_count, int *bit_depth)
 {
-- 
2.43.0

