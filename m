Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367599;
	b=bo1iXyvRlMqddV7lu40GO7XoMn5AiM4HVbwhVc99y+D1qKFwx/Swu03JJGHyWoLiSKA3
	 W6TlikBaZW1p/SKTp44DiYYEbbRQioJ4eS4hw6eBEOT4QveKtq5mZfjukA4RaKbBQEUY3
	 pdfbqPyLTWyk1P3a00CrjQtfBfSI6GsxbvYxxfPn4mN1kE8x8WIfJ8lJOGU1Q1Vc+/Owv
	 qrDLTNMR0FM3ayxgGRjZWlANeO3Tz9PNECF0caZhNzB6FwvWQ00dUAtkYFvIw1A4dhDGP
	 gpM0XrnnNmES8XZpIWkl1P38brDzHJesUsOLzP89woXdXiovXheA0P3pv2ON+mOC5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367599;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VBpPBL53Xz0E4a91EvaDsqa0f+hUJQsTAaCimEA4Iio=;
	b=NuKU0dEXiwlFMEEmUZo9lSTUp781c53aeKkDIwDM+nhQsLlbu5G2mAvOgKG+hPZRRLbM
	 as48uinNBRwjlHwCIInUQBzdbxHiLLiZmLATYHLUBppjF7Qyyvr6UjD1pM/Do3gTZ0Z0o
	 HtbH1dF/83PI4UwaSyk3D5J48DwHsH2yqzKEC0KNXjFkjE3Sh7D2eBRtg7GQbawYZEQiL
	 BV3YqWjwJ9phuYKn7FCHrKOrxeKVCKfJjJksNwApg13lO/TN8HmrGA30WaGJfgP4t+oSW
	 legl4O7q4If/sazTY6g1Y0X4O1mjv0Tq71Khyv8agZ5r2Z5Vo6paW8+lwC74dCOUpTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmsZMqdq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE5606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmsZMqdq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07551F00A22;
	Fri, 30 Oct 2026 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793367598;
	bh=VBpPBL53Xz0E4a91EvaDsqa0f+hUJQsTAaCimEA4Iio=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CmsZMqdqXkYfFUHpXot0uwBCpqs9OPEPDZ508zOe99Fc0DwD1lJO1x61XqMPD4m3B
	 +LmUxem1Z0eIq71G8UxFM1NQoz8VXrrQd/msMkNT2Y/JEOr9kkJtFIxJpLti/o1ZSP
	 lH1zNT528vGokPX38TqvSSTidNpkK2u+rQMTX388pKc/HYS+XN/DiyDgp1T/lMawkw
	 Za14zdpsZrBDcghrg6/e97sZk5UvF+WFiPaEfiyXw63xLzwKIb+bdMsnOHWuCeUMXM
	 HOLDWXGU/bAYw80U6sGMNI3ONCV51ZXIEifiv8+eVOpPflOvBTxOgCJ5WtG7/+8Kkz
	 rhYbk4eaujwHQ==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] ASoC: rt721-sdca: handle HID button read errors
From: Mark Brown <broonie@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261030085735.2146047-1-thnkslprpt@gmail.com>
References: <20261030085735.2146047-1-thnkslprpt@gmail.com>
Date: Fri, 30 Oct 2026 13:37:41 +0000
Message-Id: <179336746143.87968.13597851437825555245.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=499; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q7wESmG6CWuFRF+n+UK7nsbQE0q9a04NfnTMDFXt7Rw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKezNNJnCl6667UozO2ZWZzplTIPJaS/H71hpP40yuFT
 bnWy7/ldpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAigYcY/rvXbBbvjf/Mb/ni
 xmdWxVsdpm+mHE8/ZCrep1DEZbjI9SnD/5hjnAq9Z78Zd145mMi775WJ+Hc5rqJ5LrcadPlDnh4
 0YAEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> rt_sdca_button_detect() returns zero when a regmap read fails,
> so RT721 treats the error as a valid no-button result.
> 
> Return the original error and skip button reporting when a read
> fails. Still report jack changes, and clear button state if the
> headset is removed.

The Sashiko issue with missing updates when we exit early seem valid at
first glance:

  https://sashiko.dev/#/patchset/20261030085735.2146047-1-thnkslprpt%40gmail.com

-- 
Mark Brown <broonie@kernel.org>
