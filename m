Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93751494D9;
	Sat, 11 Jan 2025 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589512; cv=none; b=D2pop6kjyd/0XzQtXdQBXbW/GJhS3KxZbxTdIteWAOAZwgBSkQkKCNswx8rdw2Yl5NEU5BZRtE3qDs+omB2SPSVepI+gp9Ul04FpdsHq3/WWEZ4EX2BQKt0bVxqAjZXNottql6O3zKDh5itOJXcW4q2WuzIHCWLW6b3qze+w2+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589512; c=relaxed/simple;
	bh=Pjxv0OC3V+P0+MTz2t89CknFvcInDGnutnEZM1qAonU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IItpMU6I7wlkVe2GSCO1R0/4keBzVTIoZsTqFl6vKub0suWL0oqt4jhIrUUT6uDa4ydbEi71bRoDzooHPu6sRUsRG2PII/qhrZq4pg1vmEeMDtS4Y/oq0UCeAcWVQqPeHJ3YhqitvFDnfNezPLp7FFxZeBkRMzHAcJ/tGMiGxOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=abSfe7id; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="abSfe7id"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50B9w2Hm3150347
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 03:58:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736589482;
	bh=f9ZA32FNCUWAaY/cSkyxS3gjKfbdjvidtXCuIcPz3Ms=;
	h=From:To:CC:Subject:Date;
	b=abSfe7id+rPIrqc2C9pA8/8cW/HsT+rvRYkbS3fJ0KKGsUZtSVQZUNo/w5rBJSP3x
	 3wuhynQkUAv2EHHZQMoKFrSAb/9Qxc2dX5xXghIMuhoV7g669a4WkFUFvGv3QhA7IQ
	 pQBOuKglL6mQMoExWTWTlETAGqQa8AGyUx24fqAk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50B9w26B069153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 Jan 2025 03:58:02 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 Jan 2025 03:58:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 Jan 2025 03:58:01 -0600
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50B9vsoE108800;
	Sat, 11 Jan 2025 03:57:55 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <shenghao-ding@ti.com>,
        <navada@ti.com>, <13916275206@139.com>, <v-hampiholi@ti.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <antheas.dk@gmail.com>,
        <stuart.a.hayhurst@gmail.com>, <dan.carpenter@linaro.org>
Subject: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
Date: Sat, 11 Jan 2025 17:57:28 +0800
Message-ID: <20250111095728.1232-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Driver will return error if no SUBSYS_ID found in BIOS(acpi).
It will cause error in tas2563 projects, which have no SUBSYS_ID.
Change strncmp to strcmp to avoid warning for weird length.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0e42b87dadb8..61aec92f6536 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -143,7 +143,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
 		/* No subsys id in older tas2563 projects. */
-		if (!strncmp(hid, "INT8866", sizeof("INT8866")))
+		if (!strcmp(hid, "INT8866"))
 			goto end_2563;
 		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
 		ret = PTR_ERR(sub);
-- 
2.43.0

