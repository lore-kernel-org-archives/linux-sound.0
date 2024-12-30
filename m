Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E6335BA;
	Mon, 30 Dec 2024 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735541419; cv=none; b=oc9ACo6+LN19quehuaTkhoD3QPjFFjzDRFR43fb98Tw/RqM1cV4FI6cFm5r/ulvpkNi/kVXURRmLa2638TDXXecBw6vlstYT4Far/5dFznFuRB/BzVD7g7qpzy26gnuw/d4za524jJSl12QDL4K1I7wOcd0GgviGNdBAFQQ/Fas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735541419; c=relaxed/simple;
	bh=PQpplCUS5P00Sk1SO95jUX1WrHv+4DJrhq9yziFFqbI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GwUOlAEldp7OKv29JdHUYuA7xo79xXzEt6hApmcfFVSC5Wy2lpAQa9EGAkBlf/lZaMNphA7L+9aLu/v2nPZ+i2H0u+EHRoifG5tyPSq2HVMV8tpbx4rlKklw3U0HxAbaFv9JeHcYusuhmUWcp17C4V41KR2sYZNAt6B/W23PjOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=zTxcaRyw; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zTxcaRyw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BU6nhLN081397;
	Mon, 30 Dec 2024 00:49:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735541383;
	bh=Q/souNdzT4ZzMN6zw/G+ArGFj38Wz1XaK7pqoEQleQI=;
	h=From:To:CC:Subject:Date;
	b=zTxcaRyw3Bud1i9hIyBOE6t4Zuwciyd3VcZhdVyPaDHsPmVvHfIPPuS4HSJ3r0Lxm
	 EjfMO/rbTzrdbLl9vsNWAQUW872JJ1OH5E1NpOZhEFdmPna40QFrWHc0t/lrtWe6Hk
	 laLske/l8nN/9yWNu/fLirFTFUQ0FEig/xYgWHxQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BU6nhqP075616;
	Mon, 30 Dec 2024 00:49:43 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 30
 Dec 2024 00:49:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 30 Dec 2024 00:49:43 -0600
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BU6nZql071765;
	Mon, 30 Dec 2024 00:49:36 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <shenghao-ding@ti.com>,
        <navada@ti.com>, <13916275206@139.com>, <v-hampiholi@ti.com>,
        <v-po@ti.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <broonie@kernel.org>, <antheas.dk@gmail.com>,
        <stuart.a.hayhurst@gmail.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
Date: Mon, 30 Dec 2024 14:49:10 +0800
Message-ID: <20241230064910.1583-1-baojun.xu@ti.com>
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

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0af015806aba..0e42b87dadb8 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -142,6 +142,9 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 	}
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
 	if (IS_ERR(sub)) {
+		/* No subsys id in older tas2563 projects. */
+		if (!strncmp(hid, "INT8866", sizeof("INT8866")))
+			goto end_2563;
 		dev_err(p->dev, "Failed to get SUBSYS ID.\n");
 		ret = PTR_ERR(sub);
 		goto err;
@@ -164,6 +167,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 		p->speaker_id = NULL;
 	}
 
+end_2563:
 	acpi_dev_free_resource_list(&resources);
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
 	put_device(physdev);
-- 
2.43.0

