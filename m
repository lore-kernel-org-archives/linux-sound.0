Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB612D0621;
	Wed,  3 Sep 2025 23:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756943728; cv=none; b=D8c0kKiEQI6zYjT62pnADuxJuXomdIIHV1HN2MRHGpNeaHEaavNi7yiuHp3ON+bkvRABiTO9AFNaG7taP5ezZP1Sc8GysRE/MvHc8Nt3K1TGXEn/RCsOT37Mk9JmW3RzZ0HJjO/9Wno40mK99EByT29c+hc1z586+D4udcW0e+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756943728; c=relaxed/simple;
	bh=majjpVsrAezwBPYKwF9mTQqwWF9pek8+QvCqb47AqUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjPKqdjXiAiwuecWa821ORPjBX48S5ACWMgt6YLriuvX5N1+L46N402UWlkZxDZf9T7hvQn6BwcVx7NC12FywPfxJ1Lpj2nS/bntzxWZTk8Cl0Vku9y6Fd/KBelCAp48PxurnqirD2GdgEVgoyRHm31gpQAbgAV0PVWsedk2QQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XN98F5RZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XN98F5RZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9F5C4CEE7;
	Wed,  3 Sep 2025 23:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756943727;
	bh=majjpVsrAezwBPYKwF9mTQqwWF9pek8+QvCqb47AqUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XN98F5RZ0xpUStiDIlcw+pqy9oBhUJJy7vpjtIYpKnMUi0UWZ20H4xnGzus7PLn5e
	 4Na3Oy4iKLb+Tzl0AkLXKypmqt5jOPszwUc6lh6UpoynShF1LI89TyZ4ycPjK25dBK
	 molujDsiJijTx54JVtIZVMxeWlUhYsG15g/8vuCAMyx7egVTM5r6YLcjsnOelGHpO4
	 Dhj8vTZvARvdjbHDetJfL8CFigMedNmKQtIeg/BPwLe9k564qTv9SsZLliutVstz0A
	 TNA3iljl3M9RPmXNKzM6apa3G1qjOB3O2rSvNAgc9q1uRUBN3IO7DQq2gnvLfcgDhF
	 tH9o4xu1CzcAw==
Date: Wed, 3 Sep 2025 18:55:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: devicetree@vger.kernel.org, shuah@kernel.org, broonie@kernel.org,
	linux-kernel@vger.kernel.org, drake@endlessm.com,
	patches@opensource.cirrus.com, zhoubinbin@loongson.cn,
	matteomartelli3@gmail.com, krzk+dt@kernel.org, KCHSU0@nuvoton.com,
	katsuhiro@katsuster.net, lgirdwood@gmail.com, conor+dt@kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: nuvoton,nau8825: Document
 routing strings
Message-ID: <175694372531.3388507.12383098001522648651.robh@kernel.org>
References: <20250903160119.83625-1-jihed.chaibi.dev@gmail.com>
 <20250903160119.83625-3-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903160119.83625-3-jihed.chaibi.dev@gmail.com>


On Wed, 03 Sep 2025 18:01:18 +0200, Jihed Chaibi wrote:
> Add a list of the nau8825 pin names to the binding's description to make
> it self-contained and improve the user experience for board developers.
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> ---
> Changes in v2:
>  - Rephrased description to refer to device pins  instead of the
>    driver.
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8825.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

