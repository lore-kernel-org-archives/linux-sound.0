Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF005482CB;
	Mon, 11 Dec 2023 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjql207L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8D4C433C7;
	Mon, 11 Dec 2023 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702303382;
	bh=IJpioSTRJ4vBfYbGOTUXezj+GD42AXQJ13SUCUwtDxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjql207LZgfj4o9ykHXGK0gd1Xwjr2kXeeUALQ5cw8HchBizc9s5UlrcF9YeCy5dC
	 21N+P6DnSRaA4lflezQznwU/Y58Y+xeRDDyJRe6AZ7PSyKmi8aZmYwsJbTBjUEU3X5
	 LSoYdOolaYE6emqBLpZKS69etwpgpLRq3WwvV26K1FmGoqN6ZMQBgZbzV0YBY8w9zl
	 Nh25mSjXRHPL21E63FN8srkbmu/vC6KF1Qm+0zo0BxQvtudrVR1+PKrst4a9ZX1DYK
	 8iOCeA3qJVIBlDUmsJj37IGllCcqcdVmNfklfw2LYKJRkIQNkv5c7M1zADQ88AnlmV
	 +Q+h2JGGfUzrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 3/7] ASoC: cs43130: Fix incorrect frame delay configuration
Date: Mon, 11 Dec 2023 09:02:46 -0500
Message-ID: <20231211140254.392656-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211140254.392656-1-sashal@kernel.org>
References: <20231211140254.392656-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.301
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

[ Upstream commit aa7e8e5e4011571022dc06e4d7a2f108feb53d1a ]

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20231117141344.64320-3-mstrozek@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 95060ae7dbb40..0ffd935645553 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -581,7 +581,7 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		hi_size = bitwidth_sclk;
-		frm_delay = 2;
+		frm_delay = 0;
 		frm_phase = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-- 
2.42.0

