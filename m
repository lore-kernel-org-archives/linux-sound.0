Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com [198.54.122.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B364385D9F;
	Thu, 23 Jul 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835694; cv=none; b=X3YwPrr+qL054MXZ3AAMf04P/JGhd4PwWwXEcJdQ5DlMeVCgYb+XX9WE+TX9yht2K2lSSTgIuvuAkc1Vso/kbznzi0uS9SBt1nGVqEsn//A4M0NFHrm29oaiW20HpYN9ggp56sqUnWIhsw0lPlAPh7s4Ddc8mH9/Tl6JUERBwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835694; c=relaxed/simple;
	bh=EHbV5b4pM+yqB8Fvu5UDqJ+ul5JiE8AwLN9LGhuIaHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJ6pFHBtcKMR4JkQl38Ncn9I/5sPyMa7TX9iq09D5TpljwDFAVAVg8AGGmMps1/t7kSdQQansFfN/Md3fvvivaYfpJ86hCbsUmJavW8nr/W6u8l/d2l4qNk53DkSd/zIgkXAh4qcpKiUZSrcihviHS/QvG/5LiGaDcB7BLvVZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-14 [87.215.145.39])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 4h5hLd179Sz3hhTK;
	Thu, 23 Jul 2026 15:40:56 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add Qualcomm WCD9378 (Tambora) codec
Date: Thu, 23 Jul 2026 21:40:45 +0200
Message-ID: <20260723194045.49021-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Srini,

On Thu, 23 Jul 2026 00:42:10 +0100, Srinivas Kandagatla wrote:
> The most obvious follow-up is figuring out how the mobile-mode and
> compute-mode WCD9378 drivers coexist under one compatible.  Jorijn's
[...]
> tree without racing to bind the same slave.  I would like to line this
> uip with Jorijn as a follow-up to this series.

Happy to line this up. To ground the discussion I ported the series
onto my FP6 tree and have mobile-mode capture working end-to-end
through the class framework, including PipeWire in Plasma — findings
and a proposal below.

1) Arbitration, near term

Your probe already returns -ENODEV when qcom,compute-mode is absent;
v2 of my mobile series will add the mirror check, so neither driver
can bind the other's slaves regardless of probe order. If a single
owner of the modalias is preferred instead, a small wcd9378-common
stub dispatching on the property also works for me — your call.
Either path can later sanity-check the fused mode the way the
downstream driver does (EFUSE_REG_29 PLATFORM_BLOWN, else
PLATFORM_CTL MODE) once register access is up.

One mobile-specific data point for the split: in mobile mode the SDCA
control space is only decoded on the TX slave. On the FP6, a paged
read of DEV_MANU_ID/DEV_PART_ID (0x40100060/0x40100068) via the TX
slave returns 0x0217/0x0110, while the same reads via the RX slave
return zeros — with the RX slave's standard SCP DevID registers
reading fine. That matches the downstream driver, which creates its
only regmap on the TX device and drives the render dataports through
the RX slave. So for mobile RX playback the function control and its
dataports live on *different* slaves; a per-dataport slave mapping
(or similar) would be needed in the class framework for that. Capture
doesn't have this problem — the TX dataports sit on the control
slave, so no cross-slave mapping is needed there.

2) Bindings — one file

Patch 7 adds the same new file as my series
(Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml), so
one of us should carry a merged version and the other drop it.
Suggestion: the mobile side keeps my v1's tx/rx split shape, with
the v2 changes already committed on my binding thread
(qcom,{tx,rx}-port-mapping staying optional, matching
qcom,wcd938x-sdw.yaml; qcom,{tx,rx}-channel-mapping dropped). The
compute side keeps your qcom,compute-mode if/then, extended to also
cover qcom,port-mapping and #sound-dai-cells. As posted, patch 7's mobile shape wouldn't
validate my mobile DTS: it defines a combined qcom,port-mapping but
the description references qcom,tx/rx-port-mapping, and
#sound-dai-cells is required unconditionally while the mobile DAIs
live on the top-level codec node. I'm happy to carry the merged file
in my v2 so your v2 can drop patch 7 — or the reverse, whichever you
prefer.

3) Prototype findings on patches 1-6 (mobile capture, FP6)

What I ran: your 8 patches on my 7.1.2-based tree, plus a new
wcd9378-sdca-mobile codec registering its own sdw_driver for the TX
slave, static sdca_function_data for the SmartMic0 function
(IT11 -> OT10 on DP1, with PDE11 as the power domain), and hw_ops
doing the vendor bring-up
(micbias routing, bus-clock indication, a clock-stop hold; supplies
stay on the mobile top-level codec node, so hw_init has nothing to
do — that part of the design accommodates the mobile supply model
as-is). Capture works: the card binds, PDE11 reaches PS0 through the
DAPM supply widget, and a 1 kHz tone played from the speakers
captures at ~46% of full scale through the SDCA path. The bus-clock
indication in hw_ops is partly a stopgap: the core path discussed
with Pierre-Louis on my driver thread needs the qcom controller to
set prop.mclk_freq, and that patch is still on my list. The
prototype branch (your series + the mobile codec on a 7.1.2 base) is
at https://forgejo.catcrafts.net/Catcrafts/milos-linux, branch
sdca-mobile, if useful.

Findings:

a) PDM dataports. class_function_sdw_add_peripheral() derives the
   SoundWire stream/port config from the host-visible PCM params via
   snd_sdw_params_to_config(), but the WCD9378 mic dataports carry
   1-bit PDM on a single channel (the working mobile driver programs
   sconfig.bps = 1 and port ch_mask = BIT(0)). Result with the
   generic path: "bps not matching" from the qcom master and silence
   on the capture while the PDE sits happily in PS0. I prototyped
   optional per-dataport overrides in sdca_entity_iot
   (sdw_bps/sdw_ch_mask) consumed in add_peripheral, which fixed it;
   maybe DisCo has a proper home for this, but something is needed
   for PDM parts.

b) The IT33 micbias cache-vs-hardware workaround in your patch 8
   (drop cache + rewrite from pde_pre_pmu) ported directly to the
   mobile part's IT11; I carried it prophylactically and haven't yet
   isolated whether mobile strictly needs it. If it does turn out to
   be family behavior, it might argue for the class handling
   has_default controls on PDE power-up generically.

Userspace needed no changes beyond UCM: the class-driver card works
with a ControlExists conditional in the same profile (the stock
branch of the conditional is the unchanged stock sequence).

On interrupts: sdca_irq_allocate() got a valid IRQ out of the box on
my board via the bus irq domain; I haven't exercised actual SDCA
interrupt delivery (capture doesn't need it), so I can't yet say
whether the INTSTAT dispatch issue in your patch-8 comment reproduces
here.

Longer term: until the framework covers mobile end-to-end (the PDM
transport and the cross-slave RX question), my posted mobile series
stays the working mobile path — the v2 above is about the two
drivers coexisting cleanly in the meantime. Mobile capture converging
on the class framework looks realistic (my static tables came
straight from the posted mobile driver); I'll keep using the FP6 as
the mobile-mode test vehicle for the next revisions.

One dependency note for your platform posting: SDCA register access
on Qualcomm controllers needs the SCP address paging support now in
soundwire next, commit 999f80904763 ("soundwire: qcom: add SCP
address paging support").

One small nit: link [2] in the cover credits "Jorijn Rikhof" — the
surname is van der Graaf.

Thanks,
Jorijn
