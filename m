Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CB20F089
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638720; cv=none; b=UVpGhBo1bVDutJ9HbL7NdaLMlqNOE5OZ7O27Q9sir/+iqnEmD4rNvKjmKWmlMHXgVRMsCl4GHCbVGO4zCyJ/dezmF5tYnbK7pB5tRTVKDiuCo1RRQ3veC8b2pD7iWZ9L2rKV95rVE+Wqgubod6xl0ffmvqH9h6S1gsYLpkqbZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638720; c=relaxed/simple;
	bh=Fk2LKS0zCjcbwWr9bCjam0OsFF8fZKWjYLL3YwI6m9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=VnWbyybJBmhAapC3vNmwwVnRXSC9MT3jsIXTWq7uc+PHRuUVmy9LIt3VZlMLqOFD9pzbo44OsU0EKlOYpol0ws7Su1nU+sCE23a+JVnmtnRg5dJbB3S7eG2IAXEgHEq9lEsLBKZyWttj3db0i13Wge665k/t7EUr8HFxOtTxX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKDOd0B6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKDOd0B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737638717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yfPf3SDs+Co6NZLx8rKebcB3GgFcPCwsglZCeFpKEX8=;
	b=RKDOd0B6/LVW2FqkJE9Ch60dzdij1tirIoI575BOSKy4ybZ+HUpuFHdER3jLDJ+NphU9bS
	9sMl81qj29EAx/dufrtmN6JmPcqJQ6iCIUsYm0yTZ57T9AUYtJRjDyvJEOe2lF2h1Zrd+m
	qaAiuN6cuE84PRLOLA5NALMvpQ4eCV4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-NlOlwtW4M82ksBFceg33ZA-1; Thu,
 23 Jan 2025 08:25:14 -0500
X-MC-Unique: NlOlwtW4M82ksBFceg33ZA-1
X-Mimecast-MFC-AGG-ID: NlOlwtW4M82ksBFceg33ZA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A616A195604F;
	Thu, 23 Jan 2025 13:25:12 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.39.194.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D0FA19560A7;
	Thu, 23 Jan 2025 13:25:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V
Date: Thu, 23 Jan 2025 14:25:07 +0100
Message-ID: <20250123132507.18434-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QStc1YOEBaTuT-670X-Iy2Q8JLPgExoi2dHf9Sn_Hks_1737638713
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The Vexia EDU ATLA 10 tablet comes in 2 different versions with
significantly different mainboards. The only outward difference is that
the charging barrel on one is marked 5V and the other is marked 9V.

The 5V version mostly works with the BYTCR defaults, except that it is
missing a CHAN package in its ACPI tables and the default of using
SSP0-AIF2 is wrong, instead SSP0-AIF1 must be used. That and its jack
detect signal is not inverted as it usually is.

Add a DMI quirk for the 5V version to fix sound not working.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 9caa4407c1ca..6446cda0f857 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1132,7 +1132,22 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
-	{	/* Vexia Edu Atla 10 tablet */
+	{
+		/* Vexia Edu Atla 10 tablet 5V version */
+		.matches = {
+			/* Having all 3 of these not set is somewhat unique */
+			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			/* Above strings are too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "05/14/2015"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_JD_NOT_INV |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
+	{	/* Vexia Edu Atla 10 tablet 9V version */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
 			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-- 
2.47.1

