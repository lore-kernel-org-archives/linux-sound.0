Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4721C16D
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215884; cv=none; b=KuSZaFLvy+twJqzYBsvJPgOxrlCWINTAGDpAekbDottWITXSNf48RcWrbQCKmiUnvIodF4FXROJ6y3MJXnyWFmJavmIz8n7gT8GDjXFNeF0CHrpG95i3CEv0WT9sxqEuO/zuqkPaDCvW6qCEDxHtYbytzT9KZvIzrjMCfj71pmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215884; c=relaxed/simple;
	bh=UW9TWzR4IEpFi/vAQCG6kyviN4RyQJrEkeAu+4eu2ak=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z89pzqsLbpu5GJpYOAjF5reo/u+ho23+oHLE3ECrL5AZVU0vRqoF16bsrI6SUHJDeTNztiVWM/uKIaxpoukGm7i/0ZjIL+iF5dglNYkjUhpuSDJDQQyjqElWZ5bIk4xUdrFemHHf/+S/lgjDjfL6j8Ad7ZVn0+bUj3WdXj+fjhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.172.39.205])
	by sina.net (10.185.250.31) with ESMTP
	id 6824657300007345; Wed, 14 May 2025 17:42:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8FEA5EF899F0429C9EE7B213D637B2FC
X-SMAIL-UIID: 8FEA5EF899F0429C9EE7B213D637B2FC-20250514-174212
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
Subject: RE: [RESEND v7 0/2] ASoC: codecs: add support for ES8389
Date: Wed, 14 May 2025 17:42:11 +0800
Message-Id: <20250514094211.35394-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> That's not my tree, that's linux-next.  MAINTAINERS shows:
> 
> SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
> M:      Liam Girdwood <lgirdwood@gmail.com>
> M:      Mark Brown <broonie@kernel.org>
> L:      linux-sound@vger.kernel.org
> S:      Supported
> W:      http://alsa-project.org/main/index.php/ASoC
> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> 
> and note that above git is saying it's not got a useful SHA1 in your
> patch so either there's a formatting issue or it's not quite -next (the
> repo I apply to has -next so would see -next commits).  For things
> targetting 6.16 you want for-6.16.

Thank you for your reply. I will check my next-branch.
