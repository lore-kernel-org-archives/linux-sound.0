Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A8221FA4;
	Fri, 27 Jun 2025 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010558; cv=none; b=b3tX7WYqqvjLcD8UGQszWwjPkvmYofcNsBdt7D4+W+pKs0lK6+IdkWd/9n6k8uU4Ns/WtLPAJoCsODmLfcdRT83RPpd5T4RgBQ/zd9NYw8yrSfP7oyEfeGJYBiBlCc5seHrlF5ps2hUW/InjR0jCorhTDRLmGNi1XEaiCgh1Ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010558; c=relaxed/simple;
	bh=FolFMNiWnCqgMjqoIOy1OjdQzcgAecmWXevBqf25Koc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0q/bSBGQjxg4mD6bL6eDBU3yKEBFNQgX/nqbscMkZg0I75YYetMpYbMHwcz2VnunwDXZZZXzNFvkARVHCJNN0ALp4MyOlrr1Z7fouW6sqM1TRphVAN2bKKWytPV00dJFQZbBV9Fw7UUiLU0UZeY6Ox+aO5Uh47Dj+MMEGtq0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9EnCSxT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9EnCSxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13817C4CEE3;
	Fri, 27 Jun 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010558;
	bh=FolFMNiWnCqgMjqoIOy1OjdQzcgAecmWXevBqf25Koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9EnCSxTuwilq+SYIYM1CCDOE3H0PuOonBpOTtYEhKXfaquQZx52VSOZQCeJJLy40
	 qsHU7mcCXdJn5qpQYj9S8wXHsZ8KzApTuSGZeqQzSx+wb9RBo5U8KtZgrjtUbBzaCU
	 6x1+x3C7kFH+U0SpPB0VpEUYVmkeMa45XBwMrpSvSr3VmN8odgLnoR5s6zI+Dvv7nf
	 JyS37op8wAuqzgS/WCsFw2ER14QAKpTPAloyyxqj1n+GfTPEFbXG/n89TRr96s9RsN
	 zFxN1pbcfsZBYXaZXjNvlCPri0Wk7cCoYhnQ8i1eJfu/IO4eP5pxow6sMEyxEHHZbl
	 JoZYuxgDWWP4A==
Date: Fri, 27 Jun 2025 09:49:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andriy.shevchenko@linux.intel.com, tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com, 
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <20250627-unyielding-unselfish-hippo-39ce6f@krzk-bin>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>

On Thu, Jun 26, 2025 at 11:43:30PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The patch adds supports for Codecs(DAC & ADC), ADC only and
> DAC only configurations available in the tac5x1x family.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> 
> ---

Organize your patches correctly - you cannot have user of binding before
that binding is documented.  See submitting patches and writing bindings
in DT dir.

Best regards,
Krzysztof

