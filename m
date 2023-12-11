Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094434776B;
	Mon, 11 Dec 2023 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHjIp3jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F882C4339A;
	Mon, 11 Dec 2023 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302950;
	bh=SDuU0kpFLYtMJnu0b+/unfEAUC1cuLfY0F8bL8OneLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHjIp3jje7w91DvC5v6X0V8Tbyo9rh03bm0zu95CJTZj/gsKhy6bC36KAZMSZTUaw
	 DAVjTBRRhjeed2MIOBTJeU7J3CpQaGzSQIUZIWcmr2VvA5L/LBkPO28OhJA1e/cxVP
	 PMTL7yMzZZY3QTLFZL8b6YMF0pY0UBs5aoMi+Jx60Bc3G/EWM+ZZAaJJ6aWgZ//kCX
	 34825r9MQQnl5rTbEkWVxmhDxBmQCcSE2FZjs7CRPwLShnmg3BaZdSFrLsPDVw5qQ2
	 OqTYqilJFyxauup5K9ZJgl3808DpvJZWVMTtFvagejuCzpHk5aHuFsTnVdVXykmkva
	 v15RS7bTMFkTA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeremy Soller <jeremy@system76.com>,
	Tim Crawford <tcrawford@system76.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	Syed.SabaKareem@amd.com,
	git@augustwikerfors.se,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 14/29] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
Date: Mon, 11 Dec 2023 08:53:58 -0500
Message-ID: <20231211135457.381397-14-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
Content-Transfer-Encoding: 8bit

From: Jeremy Soller <jeremy@system76.com>

[ Upstream commit 19650c0f402f53abe48a55a1c49c8ed9576a088c ]

Add pang13 quirk to enable the internal microphone.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
Link: https://lore.kernel.org/r/20231127184237.32077-2-tcrawford@system76.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index c494de5f5c066..ff7551f318346 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -346,6 +346,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "pang13"),
+		}
+	},
 	{}
 };
 
-- 
2.42.0

