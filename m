Received: from mail-m1973197.qiye.163.com (mail-m1973197.qiye.163.com [220.197.31.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442543F081;
	Thu, 16 Jul 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196137; cv=none; b=FjWp4wEadOuDcTd6X58Az1UjmzLrhMAjtef3akkBGL3EsC/HYwFA6KaZyJHnEMM6zySiKptKdd52PtxvKe6tBRHD6YDVJdl9qxvlWOAHoM9w8yhuv9nkW3RPLR95XkFzvH206wWRFcrqqhD9bzj0FdcEafHfjpX0Sh8wJj4GL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196137; c=relaxed/simple;
	bh=jnO7+lKbYHEo4ZDzz30LozA6BlpK0wWUh9h0g+5Ykdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cy42ABP/iDjxZj0boyYQ1ea7uGOvoQ6987VBX8PzS1yxdCAxIPQvsAVEBVOBQYnMvW0fHftuSOABtZDu8917o9TO9D3d/SRtwfl17I4e/jDWgmn7ebhI89bmBAJhaY1ONbVT+7FekpNbMKuDcct4OW6EFIXPM+gNDGZunaqtLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=hS0CDgbS; arc=none smtp.client-ip=220.197.31.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="hS0CDgbS"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 466c9bc16;
	Thu, 16 Jul 2026 16:46:28 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 0/6] Add audio support for QCS6490 RubikPi3
Date: Thu, 16 Jul 2026 16:46:19 +0800
Message-ID: <20260716084619.2835456-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716-valiant-elegant-wren-fbad5d@quoll>
References: <20260716-valiant-elegant-wren-fbad5d@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f6a1b166f09d5kunma38bff0594886
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZThhLVkNPTUJIHUodSR0ZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=hS0CDgbSegqLVVQ3w14sOJ0NIGpUhua33iPOPasVm5vZyaCZrMt9UJsFqUbXtDNWY2vs5uMEhKP4wbIsqa9odAgl7ZUUYaUBpKrM5ZbfrNSAJUPlEahlcQlCuwe+3AaJ8Za/lK6OCEuHqLkJbc89i26J+Pv16Hxs3hj3h9tR/6Q=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=jnO7+lKbYHEo4ZDzz30LozA6BlpK0wWUh9h0g+5Ykdg=;
	h=date:mime-version:subject:message-id:from;

On Wed, Jul 15, 2026 at 10:02:49PM +0800, Hongyang Zhao wrote:
> > Add audio support for the Thundercomm RubikPi3 board based on QCS6490.
> >
> > RubikPi3 uses AudioReach/GPR on the ADSP. An ES8316 codec connected to
> > primary MI2S provides headset playback, headset capture and jack
> > detection. The LT9611 bridge connected to quaternary MI2S provides HDMI
> > audio playback.
> >
> > The series first documents the existing ES8316 jack-detect inversion
> > property and adds a board-specific Qualcomm sound-card compatible. A
> > generic Qualcomm headset helper is then added for codecs which implement
> > component jack detection but are not connected through a WCD codec DMA
> > link.
> >
> > The sc8280xp machine driver board data is converted to a per-DAI
> > representation. This allows each backend to select its own DAI format,
> > clock programming and jack setup. RubikPi3 uses this to drive the ES8316
> > with a 19.2 MHz MCLK and to avoid unsupported sysclk programming on the
> > LT9611 HDMI link.
> >
> > The final patch describes the two audio paths, clocks, pin control,
> > codec power and jack-detect wiring in the RubikPi3 device tree.
> >
> > This series is based on next-20260710 and depends on Rafi's
> > q6apm-lpass-dais MI2S clock control series and Neil's q6prm MCLK clock
> > ID patch:
> >
> > Depends-on: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/
> > Depends-on: https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org/
>
> That's RFC with comments, so why do you send your patchset knowing IT
> CANNOT BE merged?
>
> Last days Mark complained, Rob complained, sure, we can ignore
> maintainers, but just stop for a second and think: what can we do with
> your patchset? Really, what can we do?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

You are right. I missed the RFC tag on Neil's series and misunderstood
the status of that dependency.

In v1 I carried Neil's MCLK clock-ID patch. I changed this to a
Depends-on reference in v2 because I did not want to resend somebody
else's work without coordination. I now understand that this still
leaves the RubikPi series non-actionable while the dependency remains
an RFC.

Please consider this series withdrawn. I will coordinate with Neil
about the MCLK clock-ID change and wait until the prerequisite work is
in a mergeable state before sending another revision.

Sorry for wasting your and the other maintainers' review time.

Best regards,
Hongyang
