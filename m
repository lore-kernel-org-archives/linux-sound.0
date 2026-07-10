Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3043603D3
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705563; cv=none; b=tUZp79Bd4/sjAwPIp3Bk2nnDjglIYIFu04iQiENr2gvf8wH896deDmXFUxznJpxoGM87OOdpUwcup0fcAvx+qjM9PXyIG3oviwtKEVwWSYs6NYNx/Wuv+EnbSXlVHOwPDpdzOg66XH8wgNJdgp7p2HatjGsqvmi65VS2ehmn3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705563; c=relaxed/simple;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGTuTzRXWU+SXzyfG9cD7TJ32krE4QeK30iPKnaHNhngiBGmBEJ4iTF1aCt8LyQUW8U9oGNUZTcU2+fIG7mgpIFkat3Rpn0ZCWa+BNqPKX9bbaOEIgmR/tIPfaUY9AFU6xt2Kc5l5LjIYWtzH4JL9GwEuIQIwgBELugK3uzy5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kj7a6Pu5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kj7a6Pu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209C71F0155A
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783705562;
	bh=KvBYP+wl2IjCxMaSVmX25pjv+NEzDq5zeL7bHnenBoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kj7a6Pu5eehgdCmmTI+vwhf9nbZJIqM/gmnHg3wk7GzSc/sIfh4SLBJdGeaTBEiDv
	 b8rDzUGmQ/ofpb+jeVOCzO/AAJvsUlpTJmujo/sCcFYlSo5w1qI5V62txkfh20z4kl
	 8oUrAnr7A+VpIdb3rMwkdCVuO7ctSV2dTRn501mKvbH8XS7Ebz3yLokZ6BfsTxc9Bm
	 bPq4gjzedbjsGFpMYyyq3+099H0QssWs4bvFBBUd2pgnTSl5SQ1f1xtuAKGKw076b6
	 m1YLoNVUzOAFOWsUsdRS6GJyVcxI8PKE6nSaCG5S2VX3Fwb/kc2mr1aHX9vD75TnB0
	 Uq2zAgam/8dZQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1312188e87.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraYealRTYwJOHQoL1ukHso2NMsN96GCkclKzbpLuqwXiGvH3Jpf9wuIbAnTYqsPTw0i2p0MYtMi/kh6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4TwYHcEsA9bnOoBVX8QGeM8UxuqyVtIy4bvQha5gq1qvdRHU
	TxHTwG9wdy6aolQt/yr2rk5NAOQOYJ/cAKrTkSeVIY8x5xGEAZ0/ZvYaIuEps0j7HFacKZpLy0z
	1BctgixdxzdEaGEb4fQADLV1cskdsBlk=
X-Received: by 2002:a05:6512:688f:10b0:5b0:12d6:4c05 with SMTP id
 2adb3069b0e04-5b02369c6e8mr17375e87.36.1783705559836; Fri, 10 Jul 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com> <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:45:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
X-Gm-Features: AUfX_mz2mAY-nRqzEwN08-F9a7Mq7XiQwd_nI9Ppbf1sw-soYPlPLluIapY3fR0
Message-ID: <CAD++jLnUf6j8jPJogpuo4w55EHqgt7LChOQX5JY5h4n2VOf5nQ@mail.gmail.com>
Subject: Re: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Paul Cercueil <paul@crapouillou.net>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon <gordon.ge@bst.ai>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:43=E2=80=AFPM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:

> Switch to devm_of_reserved_mem_device_init() so the reserved memory
> region is released automatically on probe failure or device removal.
> Remove the explicit of_reserved_mem_device_release() calls in the
> dev_put error path and pl111_amba_remove().
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
