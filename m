Received: from sg-3-27.ptr.tlmpb.com (sg-3-27.ptr.tlmpb.com [101.45.255.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65F3BED43
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602003; cv=none; b=kU4jFWzmVv8BZEhr20LRHoaDeCKvypVn959gkkg9blukNvIM8WG4SqeqZC9HUiwHu15EL0DWbHYfGLFdBveqBvOoGOJIG08/HXUtS2XboKJLxPveUKmaK/eTOKM9gnc93eGv8rBqkhTKFc7Af4Lqcma4CSr0v1GrXTHEQKvpaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602003; c=relaxed/simple;
	bh=4DPajtgvOAVXvcES30KpjCxa3lHd/OR1uK8M6P8UjTc=;
	h=Message-Id:To:Subject:Mime-Version:References:Content-Type:Date:
	 Cc:From:In-Reply-To; b=bBelwt3RCygc2CnTLPQTYDY/86MlHU/I17oTRnSZlv34JumP+czDWC1+Pckouqp4a92GBxpl4QIaNzA7/v2dXrL0yEOnvwTFd6wRQzw+Qm1i8Kjps2bZjox+JuqHvNpdJzdYOTwMjPS9OczPudm6oH8L2vLp4GrDAzZamLJRMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai; spf=pass smtp.mailfrom=moonshot.ai; dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b=jUzHyuiM; arc=none smtp.client-ip=101.45.255.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moonshot.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=moonshot.ai header.i=@moonshot.ai header.b="jUzHyuiM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2510091218; d=moonshot.ai; t=1778601266; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4DPajtgvOAVXvcES30KpjCxa3lHd/OR1uK8M6P8UjTc=;
 b=jUzHyuiMqwSH/pUZsDMyoe39da8gAkVzbdzDfrFu8Kmd7VQgSmypm1Em941zZGpkPJIeKr
 Zo4RRaDlFcn6UDFIUCbkNqKZJXMCZA+afURxoXuZbLAVUQusNrKcGmc45r7epUPUtEak3z
 ifI+RLT7MYXU8+E4VM2XJdNv6F+xmgb5rLnpOC9SdvDGKXPu8I6TkkotQgnkiQQ/FlrCBG
 aeH6kBwb0gkOvHMwpe0LSsWoyJtsxd2nBW/0yLoWSQ61LPHro8wptGJD6KfHuwsK0P6VUS
 26w2PPiyNircGT6GU8igjdX6NvhS7bHNQ2+GEvgdoKHNyjrr5wq41ki3Y6WtDA==
Message-Id: <97bd47532c39bf4406842528adc5883ce43bdb25.e10e5e30.5af4.4a5f.81f8.350e11bcdcab@feishu.cn>
To: "Mark Brown" <broonie@kernel.org>
Subject: Re: Re: [PATCH] ASoC: tas2781: reject too-short writes to acoustic_ctl debugfs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <97bd47532c39bf4406842528adc5883ce43bdb25.b9dfca8f.30b3.4f6f.ab3f.1a908222cdea@feishu.cn>
	<af_e702o0i96rIMT@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 23:54:24 +0800
Cc: "Shenghao Ding" <shenghao-ding@ti.com>, "Kevin Lu" <kevin-lu@ti.com>, 
	"Baojun Xu" <baojun.xu@ti.com>, "Liam Girdwood" <lgirdwood@gmail.com>, 
	"Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Yi Yang" <yangyi@moonshot.ai>
X-Lms-Return-Path: <lba+16a034d30+bc0dae+vger.kernel.org+yangyi@moonshot.ai>
In-Reply-To: <af_e702o0i96rIMT@sirena.co.uk>
Content-Transfer-Encoding: 7bit

Apologizes, pretty new to this particular mail client and produced messy result. Will send a v2 to clean up.
