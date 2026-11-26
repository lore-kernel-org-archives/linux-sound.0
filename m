Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698097;
	b=FmJb7MAo146LIpgqTCS93ZJAN6ugs1eV1DuqagOkpjfThUIkWpZ56KCy+Hts0kMg8a/1
	 N/bWZojT0E0ACUhKNKRNo5n4LZq+3E6XPrspI22rqfZMRC5IS91TqXpP2oaFaE4mXXGfP
	 zgaa2VrRgCUhuJSwsYjCNBgg1iWGL78BW0M4gEyX6C8zEqnKUOwBzbSXEIRLA3OOoHDPH
	 j2gKEUJ+3RLXl+Ymz1bHjUDnJNuLtSt/op0LMLkrSq6+ISeXg5PviiL5hve43lCyQA2zW
	 rVlOF8BRSYewnslu5sXz5j53El3r/sy20IXHnSQL14ST0hOAcEJSD9R4bVKYBVKXOnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698097;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=bmT8vzP/apjUMpvBWqPywMdM2CvA0VW1Sq9cgVbAE4U=;
	b=DPgR+c6V37Pt84yBMA26eXMDn948/+5yRcAmRcXL3Vu/3fBw0z/CI1/9fqstB79aObus
	 AOyQOyyWsTOXxKyoZxpbx/72QiXiqxbzCZarkBGgQpVPKzq/E9QLW6GZO7H4VDhLnOXSS
	 9Ec8i/jGau0CyKJ2whMQktPFxtm5h4Bit+oF2XlMhosGep4du5nxRsFIkn1jWt/ZLj3tD
	 lRZIkCTOeD8iDw43K/u8Ji3j3zNpyqSD1RTyV+BkwmpC5XAyA2PbsYInphjR89OqGWuQC
	 6R1XfFk5L+lpW78JIH+Lpekay+tlowO6uZdXoY0yz4ovBeQnZ68IezgHDqhVwAmS7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvQSlj0R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E4606A32C;
	Thu, 26 Nov 2026 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvQSlj0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA801F000CA;
	Thu, 26 Nov 2026 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698096;
	bh=bmT8vzP/apjUMpvBWqPywMdM2CvA0VW1Sq9cgVbAE4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GvQSlj0RXbT9VMThJVGbUz80WP944GPGJxQo5irDgytjl09pNQ3GYWQH276C4RhIh
	 PmqggQioLmNCe07E5lNLj/ZgVrcgcqxnuNveVB0yR+EnhBGbu16+r1N4c6xvAt1+WA
	 1FZmdjKSP/99PNvoe0d26c/ApXANdMTgvCSnUH1GXKXDH4jsgNwf/7L8I7kzkxZfu3
	 Of6TiwdBk1k3yVsd6i+2PX2ieth2qGUOlsY5DnOY7R3H1i85MK3wooCZC/43lWBM3k
	 eDeju2/NzeEuDoMY675OxPWTXmlvqg2AoyCrLr3XBzS3prj/KuJcELdwCfmWMwUeap
	 WggD5u4TFKmZA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, vkoul@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
References: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v3 2/2] mfd: cs42l43: Move to core detach
 helper
Message-Id: <179569809495.72708.5920909967925778004.b4-ty@b4>
Date: Thu, 26 Nov 2026 13:01:34 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 16 Nov 2026 11:09:13 +0000, Charles Keepax wrote:
> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.

Applied, thanks!

[2/2] mfd: cs42l43: Move to core detach helper
      commit: 54b3632c8ec08735d3f6235d80005aa0b648c7dd

--
Lee Jones [李琼斯]

