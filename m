Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F42E7648;
	Sun,  1 Mar 2026 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330307; cv=none; b=e52gfeSPN9H4GpuBHnTDkITeqDMQOEkPtNP3QYJXe+hGt5XsnL6pi3hFQyT0qNV3/PIbKJtoeWykdL+MhoHZKO6+dnsR9pBA3JEFgSKdqTeNVT9NnJeIuK05jcmKaZrosD6chCYAZtNGimNuv6Wv0z8KdLldKU3AeCkcg8+7zmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330307; c=relaxed/simple;
	bh=uZEcPk7V8q+Q5V1pOHmLcUCdAtJv9/Gv3wyNTDRBj0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoP1KvC9AgoRaC0AcFPBU2nFm09/ogfohbseMdGHhduQHcoEh8X02HkL0IXSjHToaRGJJkW495ouoCp9eaz7D/g9qJ2pC3RIjbDAG77RAzgCA1tXmsCQ8caaFiBpTOnm7x3LtYMUuH6YDj7Q1riFQsaBnzG69LliXCd49AcKUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLU83/7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLU83/7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541D5C2BCB3;
	Sun,  1 Mar 2026 01:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330306;
	bh=uZEcPk7V8q+Q5V1pOHmLcUCdAtJv9/Gv3wyNTDRBj0M=;
	h=From:To:Cc:Subject:Date:From;
	b=jLU83/7bPgV1Lxy006x3mFAmwCZX4TwuCjimTDPlkihSXxnQW//F75wqcBeAtcxfY
	 ptFE8vMrlurn6t4JZJK3DrdseYqS6uKRc/+ZxVZKoJvUfzojafNILpwtcvf3KCpyMV
	 xCgEjHrU8mrLKoIoVzNTi89FvfUyiw9eAH0vI+upn95gZ3stnHipow4/nvL56kvW9d
	 r9BxWPE0jiqd6l9jom5Nz63IZjnWq9sypEqtWzZ8rCQoDL4NnC7rk+dVGdNBJ5zItL
	 FltT3i0TnFfgFq7ERI6qwTCYGUqMrIhFbiH6Mld/rvPlpx9XTMdCowYfkJ06gsNw/k
	 3KvRdXMez+JBw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	guspatagonico@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:58:24 -0500
Message-ID: <20260301015825.1723867-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ff9cadd1a2c0b2665b7377ac79540d66f212e7e3 Mon Sep 17 00:00:00 2001
From: Gustavo Salvini <guspatagonico@gmail.com>
Date: Tue, 10 Feb 2026 12:51:56 -0300
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X
 M6501RR

The ASUS Vivobook Pro 15X (M6501RR) with AMD Ryzen 9 6900HX has an
internal DMIC that is not detected without a DMI quirk entry, as the
BIOS does not set the AcpDmicConnected ACPI _DSD property.

Adding the DMI entry enables the ACP6x DMIC machine driver to probe
successfully.

Cc: stable@vger.kernel.org

Signed-off-by: Gustavo Salvini <guspatagonico@gmail.com>
Link: https://patch.msgid.link/20260210155156.29079-1-guspatagonico@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 67f2fee193980..f1a63475100d1 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -696,7 +696,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
 		}
 	},
-
+	{
+			.driver_data = &acp6x_card,
+			.matches = {
+				DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
+			}
+		},
 	{}
 };
 
-- 
2.51.0




