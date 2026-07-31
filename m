Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A8368D73;
	Fri, 31 Jul 2026 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785527491; cv=none; b=XFQ54b+IhC4mRwRxA0R225SFHyO26dJkr/wlFmMmvjPDv0uLtutvvvCcajkkyORvrsca2IFZmxasaVTnblfZkWuLknyl6OsMpUV5Ro2T1XftahJLn63XBwVGo/a6c3Nqik4koGy8qUGpZdOBi5MwWCICENMEvCmI/9HRvIww/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785527491; c=relaxed/simple;
	bh=MkR8ptklfQpOJGmCgl7CQFxEhPKmoHlOrUMRzUd8t2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBbxUqG5+K7K/tCrve55vMK8IyzbtBGFNQLtJ8HXrVD5d9SZP3c+WEDjJp2fe6t7NaB6VvJDuR7zuwG6m7QRIKlH7C26p8uiwBY5pPuJwijui2dDYCf+TBK3FAhAQRFAR7VkUEXqYV9QxCKTx3OhhNJlGqtKC0kVdop4gyA2FnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6saVW2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6saVW2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF17D1F00AC4;
	Fri, 31 Jul 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785527490;
	bh=o3BFrWnxaX8dliQODHPD0sKK2aXDS18uJQppXfWMLDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P6saVW2TP/ewMybOOhg+ZAiHLo4WBnb8IPGuG46yQQQXd99tg7F5DJUlfDpzOExW4
	 PjvpA5pca1fG4cJALKD/JHlXWMWbQMvJl5aISQGKf94d5/Sb2LRoQh9NWqjAI9Ln6m
	 P3XvwgrKcF8O6mqz/yeFtnxiaERNjdBnQgEJ8S2iXgoHheyd6G9UiZB8HS8NXH8Ih8
	 e554OU1Q5b/B9eTOeIJR5uFMCdi8/Ka/wAj2I55uhx2qvxZSyJ1ummrT2J37k1OTlx
	 zlvmg17+auc227rmQmpHm3wD3ED/ZpiBvdOdCZ9wd7VvhWlGvoT7/86pXyH4BovBF+
	 Fr+ZrfaUmZjOg==
Date: Fri, 31 Jul 2026 14:51:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>, linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Darren Ye <darren.ye@mediatek.com>, devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Jaroslav Kysela <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound
 card
Message-ID: <178552748845.1454226.10384095469875054349.robh@kernel.org>
References: <20260731064326.2284228-1-ansuelsmth@gmail.com>
 <20260731064326.2284228-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731064326.2284228-2-ansuelsmth@gmail.com>


On Fri, 31 Jul 2026 08:43:21 +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE SoC sound card.
> 
> The AFE handling on this SoC is very basic with clock always enabled
> and all the power saving feature not available.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

