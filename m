Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5D4DD6E1;
	Tue, 21 Jul 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647191; cv=none; b=IMl9Iwqs5rLJLXAzgY8j/dFPPYWzI2mNgmdPuEUX7NaeNvgs1INc0OzcJrr6CVdKJIHfUnulK75FCpPOLfVOVLNd0ITFHb4pKPcBTFOXplK6iDWBJ96J51qg0TCJNLV3Pz2IxWfyYR/9a9ezbUzRUqk4binPmzO4obsoNJU98Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647191; c=relaxed/simple;
	bh=HHXJA1TieWPTmFMhLYc09XHjMchzAXlmW9zZSTjsXyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOjNLcQ9DCGxourua0XXRU9U7dr9EEZ370FzIUMUnSZQSjxlFTXQObKOjcJEkRrCfFQSl5ovmtupiykaNFFM6WCrW4M9wVUlyRecv4h/UVbBLe1Ds2YwzkW8cSLIbYBtoMHBDpiLUmXJ1eun0gmmYa2fiY9+ho4K+qZWLDa9pNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=rmVv5R5x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QZYVMdKn; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="rmVv5R5x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QZYVMdKn"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9024E1400114;
	Tue, 21 Jul 2026 11:19:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jul 2026 11:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1784647188; x=1784733588; bh=VETUalcn9FExOCwAtkA00
	GrwRCYuxXDO5yxrnuT0dYI=; b=rmVv5R5xTvtHkPWmP48xhP/YT02y4YLeJTZ/h
	OV2D83m8wsiN/Up8GOwG/Uw04VB76jtDi1nldmTXGttlOpXEvTL5YJTD3QmQ0g+F
	aWGHASPRop66QNAZTJEP/gifbWCfrjkpkbf3UazUtMzan6J2TfE3G1vLO3vI1LR1
	m3yrq7aXr0a6JmQ82dIPJFNL5IoHG7Bp0IX1m/XRGccIbOmPF++HwCfjigjvGAz7
	4Y/kCqTYqTf2YVhVmWRB2J+IFa110oH+5wQgXUVszZ4oFleJ2+NCDz+nceA3EAic
	nHqmJLdBGP5+uuP0Hkem5ON09nlymXDSgSUieHUnr7c+w5BlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784647188; x=1784733588; bh=VETUalcn9FExOCwAtkA00GrwRCYuxXDO5yx
	rnuT0dYI=; b=QZYVMdKnvx7Chk7xXpAsPM+qomTVypaADqRFki1PvMFAj8C0QQu
	rvvGdDs3BxgUhE5xjGwmdW495h28OKssF/4AZXbKP7wVpwTANXO19q5e8SOh21lA
	gAOqidT/jMELq0mbLAujI+sL9lH9RGYtSsQhk8wK6d8qHn5G9Tj2VaKRedcfem0F
	j876PGlmOQtNkpxefJk23Jmtp/4YiGLJfFOwujIylbDgXMToCPham9UckS2nRJci
	4oCQhptJBrDHP3HaDTx24dihfBllgeAlTbm5Qz/e5zomGFp8KWgyoNoElzT8ef7A
	okXoS+qZhw4gFrT2HsiMz3ZoEcPNSTOeavA==
X-ME-Sender: <xms:FI5fatSGkRZeqywZMS4yR9hhvFFVHnAvNtM4Uw1bcCV4REB5GOCJJA>
    <xme:FI5faruVFYyASZGQo_3xrnx-n6jq1vcyzsqFI2EbmVDLnzEwO5zrjB1SY5guuuX-M
    4tql2D9J4JI8SjoZCCDbpP0OsEtXOfeyKtxzhq71tI_B5bW5rtC6w>
X-ME-Received: <xmr:FI5fanHymr3YyGwP95GvYOg4kNF6rFKb82J8KMZSR5luEYXaZ3Fwd19dDvF6Q0iivmenzC12uuVDtpFxWQ_2wQ>
X-ME-Proxy-Cause: dmFkZTFX0rd0+8aB765LC8fzLrzd3iRBc6Elm7l87j3kFSfVgIDPbvqQw+fCKCUapNtZ1V
    LIc9OazlWLcEMNvPI3QU3X838Uun5YN/CkDgL0jOOiD1xNPYHenVfJ6LQedFCVOpNUnKaJ
    K4RuFTByWdDaF95G7qaWnY53iKY1JowrG5rVEtblGmq4OAJLEf9UXPfe5WCbbM7322CpSf
    cMT6k3r3pFLk7l+pQQuQX8kiuIpNyBPpkHG2+Pih2yeh73reM1UEqM1MRvXLftEuKE5W+9
    EeTsCkKF82paC+gdf/NE7zc2UNf6cIZ/EAg30GAsLZJQtncgKm4EY7WVRGulLqFs27Waqq
    ltoe/kthCKFtvZwt//aW+MaXt4TuTOGj1GFzMs/k8D1pLDYNnRj4Rc0neB2Y+w+66p8vU0
    IXAuUDdLPOO8PE5LmJ5E69lD4Qq05ONFe/vzF1ur9oOYkKVKGM6d33rWsi/5ne78c2jxtW
    DqYc2P0Zj3Vza3AGqelx2IyBaECb0S1fZmaO0n3abPlAHgyQC6xSlaTov9koRPoKGZrBzy
    ca5Y1kSK54vOiyBwa9HG2CCTGkpRs70KP0v47TpKoHBEQGjsR6ZUCXpn/1f/XG3iYNbpQ/
    PMraySIyCd5l5ugBLXkFQ/LDQ8mc3ln1d/qLn1GfmdJ3zXgm7qqvYi7gC4pg
X-ME-Proxy: <xmx:FI5fakx2mICUf2wTi-jTmwJoaMrCiIRuQhmgDdWCFICM7iKj3R_Ejw>
    <xmx:FI5fap2iSXrFavHaAP-GR728r_cErmE1U1Ww8bCHTGqL_qpVbBD04A>
    <xmx:FI5fasox-79wv8xPCHQgBHl9Px0h_7uczC_sG58WEdUdADcRAObLtA>
    <xmx:FI5fauXnjfIRIYWA0s4WV2MfyDnmCWG_Z2_VCpjsS0JGNJxeSzZvsQ>
    <xmx:FI5fatUuWfP7Guzmt39nmHtmnAGuBICYUY617wLbqCCnZoVxCH8glh8d>
Feedback-ID: i06594276:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 11:19:47 -0400 (EDT)
From: Jorn Baayen <jhbaayen@fastmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorn Baayen <jhbaayen@fastmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Aspire AG14-22P
Date: Tue, 21 Jul 2026 17:19:23 +0200
Message-ID: <20260721151924.30316-1-jhbaayen@fastmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Aspire AG14-22P has its internal microphone connected to the
ACP as a digital microphone, but the BIOS does not advertise it via the
AcpDmicConnected ACPI property, so the internal microphone does not work
out of the box. Add a DMI quirk to enable it.

Tested on an Aspire AG14-22P (board Dove2_MDU, BIOS V1.03): the acp6x
DMIC card is created and the internal microphone captures audio.

Assisted-by: Claude-Code:claude-fable-5
Signed-off-by: Jorn Baayen <jhbaayen@fastmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index ec94596a5..256abf593 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
 };
 
 static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire AG14-22P"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.51.0

