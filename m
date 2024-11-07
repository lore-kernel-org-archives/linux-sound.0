Received: from raven.ceotex.de (raven.ceotex.de [46.4.80.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0E372
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.4.80.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730972869; cv=none; b=Yfy2E6jDgdNASa99putsTdTy4H7DJ2lwhHHxASL6NC+8FGQwYUUe2tG4i+mbxKLuC0W1kvwYaBeiwuzgknrwWFAhWdKia6xtn2mUUnS+Gy4ZrEKHkin8CsFsMv1uRTrDxlR9DyaTH7rz/zKIqygYF6RKQHBG/K0GIYgYxd/oYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730972869; c=relaxed/simple;
	bh=NNWlfbD6oFHMT/Cy6REuko/BSsnZ86sJFy8kvb59rGU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=THO9JiXlrsTHncadjkBb6wkW88zQ4TMJUPeHzIFOO488vQRQlF/ennr6zCNBLOfU9hWrGV0rjMU5TE4zDVZcpPDbcDo/Weh49ShOAzutJeFH7NhK+b1pVDKsVhp3VV0TbiNOZUeJ1o4KaAu3+VWpOFpCD3KQw0W/WPA9+nkfe8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mpetri.org; spf=pass smtp.mailfrom=mpetri.org; dkim=pass (2048-bit key) header.d=mpetri.org header.i=@mpetri.org header.b=iwIq4uOB; arc=none smtp.client-ip=46.4.80.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mpetri.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mpetri.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mpetri.org header.i=@mpetri.org header.b="iwIq4uOB"
Received: from localhost (localhost [127.0.0.1]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by raven.ceotex.de (Postfix) with ESMTPSA id 4XkcWC6GMtz51F4;
	Thu,  7 Nov 2024 10:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mpetri.org; s=m;
	t=1730972423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yxRH/fNFrEpsQp/OB1kRpMw3D8D9QRtN0iEvu/z0ADY=;
	b=iwIq4uOBqwNK48E6iarPXbyrC04sG/hsEM09XKtrCqJ89jrvbfFgolMSR3eij4qt3V+veX
	+suWjmKliuSrmRtnl2BCNlQtJiVApwIC2kAFXj+9cDksJw1cXLGY0sefRGTYIz6zV4vQfc
	aF0AaMRhD1rqDxPHDskIMUAVnCyesGn+w1WJ0w1WxwpJIn3tmudAuCpo3kK7NrFvrGhIYE
	NrsakGBcYsqSgTvPFoDsvmhF3Aa7LiDtqzdqCxuXQN4NQYuNnxQw7+VAn1F90c5+XoQsc6
	c9K9I2qEbG4QdA9Lx00SYlIxhCrOFm2WUOA/rFVLk79f6fNfEDY8ubQvCqm/DA==
Authentication-Results: raven.ceotex.de;
	auth=pass smtp.mailfrom=mp@mpetri.org
From: Markus Petri <mp@mpetri.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-sound@vger.kernel.org,
	Markus Petri <mp@mpetri.org>
Subject: [PATCH] ASoC: amd: yc: Support dmic on another model of Lenovo Thinkpad E14 Gen 6
Date: Thu,  7 Nov 2024 10:40:20 +0100
Message-Id: <20241107094020.1050935-1-mp@localhost>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another model of Thinkpad E14 Gen 6 (21M4)
needs a quirk entry for the dmic to be detected.

Signed-off-by: Markus Petri <mp@mpetri.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 438865d5e376..f5ae5ceb52a8 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -227,6 +227,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21M3"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21M4"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.5

