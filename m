Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3053359B
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189221; cv=none; b=ZlI7mzzDFAzFhSi7fyFlRqrjgRJcfW/9VcmtY70EvgvSbwLbR3WGlK54NRGcOOOmNamWB0cX5JtcOPXMaMtGt1oxB6sfKQcMLukHa81TRCULP21XPaGjCMCa/kPuPXWLUfZfCVFxjCPQJbzMKLJygp2Eh1OE3hS3lelJ/NqLbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189221; c=relaxed/simple;
	bh=MQ89fN2ph7JyHv7SOvjMdgOX9zJtLfaArMUS0rmmAQU=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=cZch5HySm5lA00fL+fE+rfso8t//xO0TlpiAEbT8IEMHKIQGvQiWKntGbIlh92K7/hddUCtCcUD4B0zQ6KbLZ1AOnuDEu6pRKJtADZvFF9V8IQHsTSuhcEUA0V0r3crQbl/CLtUbAMvmjdJ0jecK964MHp6In2AOe/BcYxpmXB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q8QSaTA+; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q8QSaTA+"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MQ89fN2ph7JyHv7SOvjMdgOX9zJtLfaArMUS0rmmAQU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788189217; v=1; x=1788794017;
 b=Q8QSaTA+hkoNT11UXnFAJRp9zNOsc9NIFtWP/LZM29BCl2xM6c8tTZSjHXkN3G8pqlUGwRd1
 itBc7UlpNFp9SeU8DCEw++jTfHzUidOStmSnJXX/Iwqs8z4gAfKMBL5jV18z9MEMKoH3Ss3hs7X
 ygagNRHC+BMa29s+PhIxaTCc=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 025dc90a75943214;
	Mon, 31 Aug 2026 15:13:36 +0000
X-Mizu-Trace-ID: 025dc90a75943214
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 15:13:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <4386bc53631b052c1866a91061715b009d98b04f@linux.dev>
TLS-Required: No
Subject: [PATCH] ASoC: sprd: validate compress buffer sizes against fixed
 allocations
To: broonie@kernel.org, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com
Cc: linux-sound@vger.kernel.org

From: Tianchu Chen <flynnnchen@tencent.com>

sprd_platform_compr_open() allocates the stage 0 IRAM buffer (32K data
area) and the stage 1 DDR buffer (2M data area) with fixed sizes, but
sprd_platform_compr_copy() derives all copy lengths from the user
controlled runtime->fragment_size and the write() count, never
comparing them against the physical buffer sizes. The compress core
only checks fragment_size * fragments for an u32 overflow in
snd_compress_check_input(), so a local user can configure a logical
buffer of up to ~4GB via SNDRV_COMPRESS_SET_PARAMS, far exceeding the
fixed allocations.

A fragment_size larger than the 32K IRAM data area makes the stage 0
copy_from_user() overflow past the IRAM allocation, and a buffer_size
larger than the 2M DDR buffer makes the wrapping copy at the end of
sprd_platform_compr_copy() write fully user controlled data past the
buffer. No SNDRV_PCM_TRIGGER_START is needed, a write() in SETUP
state reaches the copy callback directly.

Reject parameters that do not fit into the fixed buffers in
set_params(), and fix the advertised max fragment size: 128K never
fitted into the 32K IRAM buffer. The caps values may have been carried ov=
er
from the qdsp6 driver, which allocates its buffers according to the
advertised maxima, unlike this driver. With 32K as max fragment size
the advertised limits are self-consistent: 32K * 64 =3D 2M equals the
DDR buffer size.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: cce1396936ef ("ASoC: sprd: Add Spreadtrum audio compress offload s=
upport")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
index a7d437b49fbf5..e5249924b54d9 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -17,7 +17,7 @@
=20
=20/* Default values if userspace does not set */
 #define SPRD_COMPR_MIN_FRAGMENT_SIZE	SZ_8K
-#define SPRD_COMPR_MAX_FRAGMENT_SIZE	SZ_128K
+#define SPRD_COMPR_MAX_FRAGMENT_SIZE	SZ_32K
 #define SPRD_COMPR_MIN_NUM_FRAGMENTS	4
 #define SPRD_COMPR_MAX_NUM_FRAGMENTS	64
=20
@@=20-271,6 +271,19 @@ static int sprd_platform_compr_set_params(struct s=
nd_soc_component *component,
 	struct sprd_compr_params compr_params =3D { };
 	int ret;
=20
+=09/*
+	 * The stage 0 IRAM buffer and the stage 1 DDR buffer are allocated
+	 * with fixed sizes at open time, so the requested fragment size and
+	 * fragments must fit into them, otherwise sprd_platform_compr_copy()
+	 * would overflow the buffers. Note the compress core only checks the
+	 * fragment size and fragments against an u32 overflow, not against
+	 * the buffer sizes advertised by get_caps.
+	 */
+	if (params->buffer.fragment_size > SPRD_COMPR_IRAM_BUF_SIZE ||
+	    (u64)params->buffer.fragment_size * params->buffer.fragments >
+	    SPRD_COMPR_AREA_BUF_SIZE)
+		return -EINVAL;
+
 	/*
 	 * Configure the DMA engine 2-stage transfer mode. Channel 1 set as the
 	 * destination channel, and channel 0 set as the source channel, that
--=20
2.51.0
