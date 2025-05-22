Received: from smtp134-92.sina.com.cn (smtp134-92.sina.com.cn [180.149.134.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5D2620C1
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907714; cv=none; b=DEKKx7+KrENDy5Z7abhmD1MNAQfR5IZsy1QKKHtHbGvKFEpclUAlKI79t2KbPHvs3K26qOsQ5zHyXrWLHg2oxP+vgJnIxGZhSKmsZ+xIbvhtJu54RwDvL+r+LivXzfdLbxiVxfswRE2/kvLfHn2RrI6P89a4PSp3B50CrR+uaI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907714; c=relaxed/simple;
	bh=v5mx8hHSC8ujjutLkZQ4+PgocT6absct5dh6c41uN8Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=eGJlmP7s2c66ILsAkxkue96N/xbMQtXynQk7tyCMwMyzUMJBh3vcDN9SF2vt6DB9sYAmnPowAByuTIXSTX7DizfI7b48+AmDu7GoTyNuQBoXaHL/vnlZKWWgtJNacFuj4gv/yMXxf9QRMmtSbHOpO39EHB0w3Mk14UZ6xSZGulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.32) with ESMTP
	id 682EF4770000799E; Thu, 22 May 2025 17:55:04 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: F6B89C767C2C49F3A68479481D15E0B9
X-SMAIL-UIID: F6B89C767C2C49F3A68479481D15E0B9-20250522-175504
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	tiwai@suse.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	krzk@kernel.org
Subject: RE: [PATCH 2/2] ASoC: codecs: add support for ES8375
Date: Thu, 22 May 2025 17:55:02 +0800
Message-Id: <20250522095502.10106-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > Because the default value of the chip's volume register is 0x00,
> > initializing the device without setting it to 0xbf will
> > cause the device to mute until the customer sets the volume.
> 
> That's normal and expected, it's totally fine and normal for the user to
> have to do some configuration.

I got it. Thanks.
