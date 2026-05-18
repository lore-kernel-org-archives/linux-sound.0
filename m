Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE21DD0EF;
	Mon, 18 May 2026 06:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084454; cv=none; b=QkJsPqc69Ev0OnJW8/ThSo5W0gyyxCoAH/Y5Hfx9B39QA6n9/3QYpJ/gm8xhEMjQXtoitZfXt2XBlfaHpUM6M2nMWkhN7Y2H4AkFKIZH/2HVg9Ehq9J1PggRwliIFwg9g4n8kC/NqHDQ8hP2ipjFDwCWpaONW/Hg5EJH1lGUOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084454; c=relaxed/simple;
	bh=O6EsBYb5cXQKW5SqmIV3nbvHHWyFMWoTzDW0hRz3bp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FR9SR+lRMn+jM40/Pvu5kzuWHOh0f4e55ayWzY6NEVwq0IQ6R482AZNcuY4O7rhnEVbMI2a9ulE+wyWgvDaNBq12sykhnry0sLTVJ+T4ab50ckl/KX9qjc2ylZEnO8sAznM+SUclKbezF9vZnhuWpay9T4r29TG4zZeBbXPIcao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VOARu9fi; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VOARu9fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779084379;
	bh=MrpWH7HlsQ4718RsP2YESKmL9cnLUPJilpVnbVJ80sA=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=VOARu9fii1Yd1498A6G26EzCzm2lxzJLJqGMQRMQycpXWXv2EWoPI4DA/27pCQLRq
	 yO65AwT2j55moQzyoggL6+tGLunBN0Gczuiug/1w2AM2tLwSH55QdRxvQQhhc7XcNV
	 v020NiNGLiRSkBlejXmpdxBJi5UCxS9/1VfGlcxc=
X-QQ-mid: zesmtpgz6t1779084371t299a81d7
X-QQ-Originating-IP: Naxhh+jCT4NJs5ea8bXpSGR5yxdNPwg312+/Ll2UCKI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 14:06:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8651641378394459406
EX-QQ-RecipientCnt: 11
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 14:06:08 +0800
Message-Id: <DILKRVYSWGAG.1X39KO7JLX6VF@linux.spacemit.com>
To: "Mark Brown" <broonie@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Yixun Lan"
 <dlan@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <jinmei.wei@spacemit.com>
Subject: Re: [PATCH v2 3/3] ASoC: spacemit: declare shared BCLK for
 cross-DAI rate constraint
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
 <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
 <agHl6p-JEjpsPsPX@sirena.co.uk>
In-Reply-To: <agHl6p-JEjpsPsPX@sirena.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NL7b8Hgtati0awgSvM3gySwzlHj0YBaUB7eWQ/cT6pTx/spaUUlVGQ5k
	+q5UlcbmKB3j7EMkpbVV1ea4jh22JPlQJB9yE681lHCt0jzms0VYXyjHZTaYaaIGCC4/Nqw
	OYSNanpZu6fXGp3FhyjMkHvTyRgMSJHFWF14kUv76VgVzj+FPdH8dr0x02PIqEW3AdXBI2o
	0jIx8+io78k6GLrbhQJmI5sG6IKlBI05hurSfxq/YzPrgol4AfawK8irVgqF3Pc0EMz9CjZ
	b5SjgEPJO8Ew7rE3q9aqyMqaF9SFONDWlIZ4OazDX+te1H+3fhxxl8dMIkUjc5vmpmELwmC
	8rflv9O/W65ZfuqtNpJSjsr+VIQ7Da4PKj5cfjTgku1EnQkC/uPhEM01aA9DFP+YGvRYmAq
	T7YLHuTvQ0boQ4F4OSUQNme9vjK4btCB/QNaopROfrZY35tRKa7O8UiEM4w7OjSMQiYeyE0
	n81K0pDZ3fBPvDnjI0boX/IYGNqpG18I42GTLNgD4pKit9Jek0eCv21SN9QMf3FQAcTs2G7
	jUvM24GvvtrxozwvOMY0ruY3WNK0s7OHEamdvrCBfDQsXWvt3Ho44RLlJWuGMBgEPsVcnd6
	55b2Y6CjcOmwS30JtovrdTuVAJWe71vNXKaaZUiSc8zZM3/GZY0xudmTxmajTzicPa0J3Vw
	wyVXpxapoCbbKdDvf2AoLL0QxaVslpGZavlMLtZBiXxW//vW4rmLtFuy5vNFrIY0pm0RB+i
	EF/DEFmwBC1JQrXx+ET4HMZjIbaRZvTdewzRcyUchSFjaeeN2oGgprzS14vo3wD8KI/3i7p
	XD6ZwZP6EbLGqWwwNWZqCj74xW+NmSrn4YMF2Cwa82Kv/ZTP8oYmrndDcmT48Qq7Gm0jN9o
	D1UZXqRMEW6LV0G/g2pyzZBKfdB9NP9xG3PKURoiBWT/yQr5brlY6Ml7b1kx9a02Jiso4M2
	NCNWQvP/tilBpIVo5nj9EOkD7zu8eemka0WK3f+Jvp7pz0wLbOKrC0UA4Q4Wv7u+g/FC2OV
	UJ4k7QF+Huw3MlZPkNnGUo2sFww0gpWIAG9iHCfzfjjb0nuPWN/g+oXJh3aa/lVA5N1lusf
	jgNfmWNGlJe
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi Mark,

On Mon May 11, 2026 at 10:21 PM CST, Mark Brown wrote:
> On Thu, May 07, 2026 at 06:31:44PM +0800, Troy Mitchell wrote:
>> On SpacemiT K3, multiple I2S controllers share the same physical BCLK
>> (c_bclk). Declare this clock via snd_soc_dai_set_bclk_clk() so the
>> ASoC core can automatically constrain hw_params when one controller is
>> already streaming.
>>=20
>> For K1, c_bclk is NULL (obtained via devm_clk_get_optional_enabled),
>> so this call is a no-op and behavior is unchanged.
>
> We don't appear to have a c_bclk in current code?
You're right, I forgot to note the dependency. I'll drop this patch
in v3 so the core framework patches can be merged independently.

I'll resend it as a standalone patch.

                              - Troy

