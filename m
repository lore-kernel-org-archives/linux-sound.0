Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3EB3BBE9
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398997; cv=none; b=ixmUpiifHxoo6WvER5NKq0YWXwOOfiwGf2aYIYN1AYVt9CUXGmr36UfcduFthTysKsjXg+lxnK/ncowllmn4FWz0rIOie5OQhAliiZ7Admq2bs8P9YIQtWqHH34209A7D171UqUMU6R19R/8Pa74oloJEnM2drq7NgLH9YfEvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398997; c=relaxed/simple;
	bh=kZopwBwYcdvN3Vk+puDyATZM8g2nTgg+ZSkTVFX8Neo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q6/y4VWkz7oZFpfRUojxHrSyosIDlRBj4eTtEExuRRxDJf55C/dGSzFVKgDcJa5HVX9gv5R+gLKol79WSh49kc5O0zYiIbUNeb5TD5ClI5oyHqYhHwgkbT8RAYoZfll6blvoLyiHWmS9HIeHn3cqyT4rEYeE8zv1YuuvgbUI/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0w8qRid; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0w8qRid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724398994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4hZOUZMQSLMwwyZhady1tyxctn8wTri+VIOJIvE8JCM=;
	b=g0w8qRidn+LuUw/wc2GVaCdAU0uWJMqeZ6AFtMV5xy6ABM4T0dMovP8q8ePcRarkiRMd2i
	PjPNddcwZTFptNup3gKsvxXOqQbBCoYGQEbSOLuyub7O+gBLByVqha7rL2KsFssqRPvzgX
	lGm7XMf9+mNWVBQWYcZmjn1wPEeCsgE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-u3yymHrbNPebrtd2H8wBHQ-1; Fri,
 23 Aug 2024 03:43:11 -0400
X-MC-Unique: u3yymHrbNPebrtd2H8wBHQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 532691955D52;
	Fri, 23 Aug 2024 07:43:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.144])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9072319560AE;
	Fri, 23 Aug 2024 07:43:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F DMI match less strict
Date: Fri, 23 Aug 2024 09:43:05 +0200
Message-ID: <20240823074305.16873-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
turns out that the 2G version has a DMI product name of
"CHERRYVIEW D1 PLATFORM" where as the 4G version has
"CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
unique enough that the product-name check is not necessary.

Drop the product-name check so that the existing DMI match for the 4G
RAM version also matches the 2G RAM version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index 5e2ec60e2954..e4c3492a0c28 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -84,7 +84,6 @@ static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
 		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 	},
-- 
2.46.0

