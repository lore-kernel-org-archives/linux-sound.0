Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E44778D;
	Mon, 11 Dec 2023 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CC6ntCco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3517EC433C9;
	Mon, 11 Dec 2023 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302767;
	bh=szmlAq1Z6bzKtW/MC7jxwbInPwf7Fel6+xpP5F7yaSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CC6ntCcoqYudS/EDiVju8amNFQx/Bs2Xks5yxpkKpCzBTL5QEfNTQn8/hWNdOyCZb
	 EDPYfaJWP/mVXwBd4gP3DmELxWEb3HR2N1eySMphiBGsV3d8x1zfsgh88C73Fh+Vnt
	 VPAgWYi4fjac9/nUOIAgsKk9Vy9gptmTVi36MEpM70wPexd5r9j9sVaBSvdl77AtGc
	 /xwccYbC/UWgUuTxDy7Hq+UfurHpSbACKomNnzAHnF4ojFn1uREZXGFRNuE2cIhTyU
	 jVzp8hrcOBmURRix302peMSZRMbB6302PQO+xIaZ858E/ygHh/DsODuVmNEp5Hhbqf
	 PmAS7f1mvdNjw==
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
Subject: [PATCH AUTOSEL 6.6 20/47] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
Date: Mon, 11 Dec 2023 08:50:21 -0500
Message-ID: <20231211135147.380223-20-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
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
index e2a510443bf1c..c425652b0fadc 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -388,6 +388,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
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

