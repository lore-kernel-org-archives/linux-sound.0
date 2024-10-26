Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C235F9C1
	for <linux-sound@vger.kernel.org>; Sat, 26 Oct 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729953389; cv=none; b=F4qJi02mUBHrvn74CYX3wzMb3Dq9oNcyzka+RDgUOF6CRHOEKzpZ1jDYZGAdezK84D2q217JAlABmQG6yTdfW98enrhN4NOE2zY82QMuwIisnw6XgNQZZpeZ5CK3b+ORU7USSSb5Q7qAD/25mV2wMue8D25sUTDJaLVvLZTR59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729953389; c=relaxed/simple;
	bh=TJX/e4Dy5Z4C3Yy5n/jg5XqriYUxUjBkFSYQc1hXe6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jkzoiuQYpOPYhqiCdDFf2J7kRJj7vUlMBttf2e3uS3rmonKBZu20Ray1XR+tkuIFirNcRg57eddIYb+j044ot5q0vE8X0eATAfkS15oyeBPty2i6xrMprgYQRC5XZEM3JwyuGpr9kvUr4k7c6dnbi1h9xxXSlY5sawqXDZ0pPd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WTrcXWAO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WTrcXWAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729953385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y3GH8sDIRzXwEBbsEQfiQvk90SzDQ5lSRPhKKapcoms=;
	b=WTrcXWAO4rujX3f7ezoxw/rfFQSE1E6zHlOjqFxnVTd02Od8Z+mS/LBxC7Z1ZoesLR0gLK
	7Sm9bZ42OboJdnjV627PhW2oDLh/bHlhQgKneqByAGB3ey3G4jNPalNDhwzN2wkQO/eSbC
	toPQCw+zfcEU8VKtBtp0V4KF7iL6sbo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-Emy5vFyvPk6WFpIJnTdk5g-1; Sat,
 26 Oct 2024 10:36:22 -0400
X-MC-Unique: Emy5vFyvPk6WFpIJnTdk5g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3600E1956088;
	Sat, 26 Oct 2024 14:36:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8FBAC19560A2;
	Sat, 26 Oct 2024 14:36:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: Intel: sst: Fix used of uninitialized ctx to log an error
Date: Sat, 26 Oct 2024 16:36:15 +0200
Message-ID: <20241026143615.171821-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Fix the new "LPE0F28" code path using the uninitialized ctx variable
to log an error.

Fixes: 6668610b4d8c ("ASoC: Intel: sst: Support LPE0F28 ACPI HID")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410261106.EBx49ssy-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note: feel free to squash this into the original patch if you want.
---
 sound/soc/intel/atom/sst/sst_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index f4c4774249ee..257180630475 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -308,7 +308,7 @@ static int sst_acpi_probe(struct platform_device *pdev)
 		rsrc = platform_get_resource(pdev, IORESOURCE_MEM,
 					     pdata->res_info->acpi_lpe_res_index);
 		if (!rsrc) {
-			dev_err(ctx->dev, "Invalid SHIM base\n");
+			dev_err(dev, "Invalid SHIM base\n");
 			return -EIO;
 		}
 		rsrc->start -= pdata->res_info->shim_offset;
-- 
2.47.0

