Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59DF18C2C;
	Wed,  8 Apr 2026 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775607708; cv=none; b=RIC3YrgY6H0FJhExq9ygMGM1GYlyPWnCetif2wQH2vjaj4FvCILYDLjNF00GuuqfMbb60GJA87xXSCUOCDofNnnuEWf2Ghf61aUR2+mMaTfVF/EuDhbF0Vm8fpHJmF7D1hRkU+PbRYNYEFvHiOKEj6Liwm/kekgkHsp1c5wStKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775607708; c=relaxed/simple;
	bh=LANGaaEmITDd8sEFLNS3mRcjX84Gr8piwK5kBm0FnHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+P8byPKJlGChDAzjRDuM86WF7/N4eLvBjobQ27IZi+Pdg8Jchd3dAq2k7EOd+Gl7Pmml2wEzp38j3KMvm3fWcsqeYVCw8Q8lZCpK4Ju8pbVpmm/jAB35G/WLuw3fBuo/Y8xfxnJccqwY/vOGLcbUG+FE4XOJmGf8GWadStU/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8GCn0IT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8GCn0IT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35596C116C6;
	Wed,  8 Apr 2026 00:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775607707;
	bh=LANGaaEmITDd8sEFLNS3mRcjX84Gr8piwK5kBm0FnHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8GCn0ITZWp4hFJIJJ5mzbrL7Wve1QGrqxgTHdxb8rXY7xwqdFQSXmweJ7poUEB2r
	 971KZxOO35HW3FhoNLzd8d4pxUD6mJNfGVwUBhgaUlxuP1EZqymEtMVccJCCjKoKa9
	 4wrE8W1u3OEnoJQH11qNLTQnE23oIl1SKy5C5mw2B76R++FfYUCe6BrlnL8OJNbnCv
	 UMUpXB8LnEy5MhezucLKWkDtOF0lt/G97qjKSiTVkWtJycT7uOnjyKK5HCnCmrLZ+J
	 efpvLFORvzc+1RbX/ZqAO6eQMj80Y2H4EpAfxd5iPPahGYRDR7ireksuSnLc4nSAhQ
	 DSYSGwT/IU90g==
Date: Tue, 7 Apr 2026 19:21:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] of: Introduce of_property_read_s32_index()
Message-ID: <177560770473.42385.8354240930232053784.robh@kernel.org>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
 <20260330101610.57942-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330101610.57942-2-herve.codina@bootlin.com>


On Mon, 30 Mar 2026 12:16:05 +0200, Herve Codina wrote:
> Signed integers can be read from single value properties using
> of_property_read_s32() but nothing exist to read signed integers
> from multi-value properties.
> 
> Fix this lack adding of_property_read_s32_index().
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/linux/of.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

