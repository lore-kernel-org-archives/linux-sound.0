Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8D375AB1;
	Thu, 30 Jul 2026 02:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378750; cv=none; b=gBPCyCr5gx5cRvAgkJ8hdrduJp5M3gnbR0rOv0XTh/EDR6GY8XxUSjLBvlGJvHAmPzwFVe9ky8nbEMT+HGJO6RBMkPBkjzqdDHhrahytj1DcppnoPkRmFbv1VIMvsDQ4lpMhpWdPNIiHOCDk313U+5yYT1of6eKN4x1VYOzUeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378750; c=relaxed/simple;
	bh=/flVKQbZtpQG401sEThXgolbj3JNkHvYqtLuL1P3CAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6zWjbe59KBr4xuygQKYSKPmBVm4rGZLqGoWdUdv+n+V7dRHdAZshdWFHHwcfGbuzwMOydOlCFKHhp+he6u/m37Gt3NA6Rn8a7mLLAoDwxe97rZlBsqCKTwzv96fPgJq4trTwWiuqb62wB/QSR+edvOgm7I2vK5CSamdap06oUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Qgfcbm9+; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Qgfcbm9+"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48194907b;
	Thu, 30 Jul 2026 10:27:02 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: krzk@kernel.org
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konrad.dybcio@oss.qualcomm.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Date: Thu, 30 Jul 2026 10:26:50 +0800
Message-ID: <20260730022650.39057-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-pastel-brainy-cat-eede15@quoll>
References: <20260724-pastel-brainy-cat-eede15@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb0d8be6609d5kunm91e5fa1f3feca9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUNPVkxISEtIQ0hKThhKGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=Qgfcbm9+CtkUUP/8Z713ndELcz+uWbQ4w1hGNegOwls4bcNAG5LQ6gnpFERo+Dds/hDTR476WcHyi7KK/21JAHjiexjaZSrvhdAE5KPI8N7vwLm++LcdCoKv09feppeMjNQzzFttEPD566fdHfFQIllhdUiT/amsSBagfZJ5F0w=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=/flVKQbZtpQG401sEThXgolbj3JNkHvYqtLuL1P3CAg=;
	h=date:mime-version:subject:message-id:from;

Thanks for the review!

On Thu, Jul 23, 2026 at 03:54:29PM +0800, Hongyang Zhao wrote:
> > The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs
>
> But you also add them to ES8311 and ES8323, without any explanation
> here.

I checked the datasheet. The ES8311 and ES8323 family have different
supply inputs, while this series only implements regulator support for
ES8316. I will restrict AVDD, CPVDD, DVDD and PVDD to the everest,es8316
compatible in v2.

Thanks,
Hongyang
