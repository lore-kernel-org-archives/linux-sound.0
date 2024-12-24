Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A9183CD1;
	Tue, 24 Dec 2024 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735034224; cv=none; b=ahNj3MXtQMTC50Nr8cgKGGlLNBrSzXGzuMFHsKpWoq2Mrz4SDs1uNYZngzGGqbqCg/Q9/vl0Yjhi6A92jQiQzH/jg3iMiYRHW7Aik/90+xAKskv5fPAR++Tb+aGemUbQm3mGYt0QMedWxfqM8/xRi4E8ekvQnxeMyy7UZRAe4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735034224; c=relaxed/simple;
	bh=EPgi7hla+Vkd3TQm+g/cMMBlpeigafmgDS8bui2Zfns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krqpPeZA2ADmFPZNrHvEzeR9kLuwXHlltERTDIev78ZNlNkKasFxTdcnOLUR11eppA4aYgeyNBot92xmx13jf8VQcX6eR0dgSWSgulx/jSwoRaBgXi/bhvorNNFBvtyj5F9vwZnQklvRBI6bDcGwKdnzyL75f5FyvjXtUcxAN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FYLdXnRI; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FYLdXnRI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CCE960005;
	Tue, 24 Dec 2024 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735034219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKbpjKbBthSdTBucd03JJd4yMT83j0QFKwNRQ/r9CVo=;
	b=FYLdXnRIS5Q58JtBnKxBqtykrCApbEB4PTqlBM/9Vfqqtn0vlZpg7Y0zTttqHOPM3aqAYV
	lQgoirfIQHoqx6tw6CyHoIj+jZ3t/nVWFQgJBDbnx3tdQNAYilza312hpSIA5TFVQ+Z02j
	WaqFqTovGWKHmFlUHP86xZhVnPGDB3gmBubiuprU4ZwUC4mDzPKWlPF3tmevyYg3DG0u0x
	BhNe2bm5KJ1ZVcBxIIRO2bnStyPoUW5IlF+/haHMVETNKalQCjwK7TftsZYPffU+KbjGYB
	gypi/B5wF2bnxe7lSGUaFoeaN6y54gGjVZqjhXtuV9fn4U3emcva6Hg41Qm89w==
Date: Tue, 24 Dec 2024 10:56:55 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 ivprusov@salutedevices.com, neil.armstrong@linaro.org, jack.yu@realtek.com,
 rf@opensource.cirrus.com, quic_pkumpatl@quicinc.com,
 herve.codina@bootlin.com, masahiroy@kernel.org, nuno.sa@analog.com,
 yesanishhere@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 yijiangtao@awinic.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V3 2/2] ASoC: codecs: Add aw88083 amplifier driver
Message-ID: <20241224105655.271068f8@booty>
In-Reply-To: <20241224031823.363777-3-wangweidong.a@awinic.com>
References: <20241224031823.363777-1-wangweidong.a@awinic.com>
	<20241224031823.363777-3-wangweidong.a@awinic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Weidong,

On Tue, 24 Dec 2024 11:18:23 +0800
wangweidong.a@awinic.com wrote:

> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The driver is for amplifiers aw88083 of Awinic Technology
> Corporation. The AW88083 is an intelligent digital audio
> amplifier with low noise.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412201745.fBpf3Ui5-lkp@intel.com/

You should not add these two lines. From the kernel test robot report:

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412201745.fBpf3Ui5-lkp@intel.com/

If you think about someone looking at git log in the future, they will
see the final version of your patch, they will never see v2. So the
final version (v3, v4, whatever) is not fixing any error as the error in
v2 will never be applied.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
