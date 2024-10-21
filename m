Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7AA1F7094;
	Mon, 21 Oct 2024 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515802; cv=none; b=TsEpHrShGSc9mRjcOKJFlWKb4odauO64Fp2dKYRuqubIWhsXSKMJqbe+gYVhyyUWSVDFGzkuc0RUX87/3WNlJT+PJw3U1T7t1vArajnRSHLJVtfk5rRoh/RIIg/MkxlafHRY4P1hXddmhmPsadLirGfkQ+cdeD0uEZXj00KEyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515802; c=relaxed/simple;
	bh=dOWFqMh59Sgl0bqhHzfLyhgYxpmp8CbQQbjRJzYH2Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p84DSNX001kkibXsAMG3vUsSUQ3/bw8BJTdDOTn1AeRy+MjHtxwCxdnVhX+sq1lG1t54ykaNVsP3yjlNrgekKRVatmcMUc1LFT3EYn5nGTI3yXEBEM5VhLBJW+nlfvk6ihf1jUpoYBcKsakcN63NrXzVcgS/ugPiCidCXED0+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58938DA7;
	Mon, 21 Oct 2024 06:03:49 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0E123F73B;
	Mon, 21 Oct 2024 06:03:18 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: soc-utils: Remove PAGE_SIZE compile-time constant assumption
Date: Mon, 21 Oct 2024 14:03:07 +0100
Message-ID: <20241021130308.3616451-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pursuit of the goal of supporting boot-time page size selection,
remove use of PAGE_SIZE from the dummy_dma_hardware struct definition,
since the value is not known at compile-time for this config.

Given the previous parameters were "essentially random", let's just
hardcode them as 4K and 4K*2 to sidestep the need to boot-time patch the
structure with the selected PAGE_SIZE.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 sound/soc/soc-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 303823dc45d7..aa93e77ac937 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -103,8 +103,8 @@ static const struct snd_pcm_hardware dummy_dma_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED |
 				  SNDRV_PCM_INFO_BLOCK_TRANSFER,
 	.buffer_bytes_max	= 128*1024,
-	.period_bytes_min	= PAGE_SIZE,
-	.period_bytes_max	= PAGE_SIZE*2,
+	.period_bytes_min	= 4096,
+	.period_bytes_max	= 4096*2,
 	.periods_min		= 2,
 	.periods_max		= 128,
 };
--
2.43.0

