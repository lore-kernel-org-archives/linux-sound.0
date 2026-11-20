Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191761;
	b=T4gFKG7JKtJPCfxSaY8elM9+q/Yf2B+eX2N8EmnXiPLiqaA7xv55dyuE1mlTrL+0GjZI
	 +WjbbYcGIAMw8s7oiVc6tw4gRzvFapoikmMk11JkTStnvVM6oz8ORkl5odHpU6LHHGTA0
	 J1q5I6lS5QEMWZnfi6vParMaqpjWpvCMcTBkAr1W1kkgb4t0sPzYkxVbcM53Syd1sVSJE
	 NonaqmaIi8z5i2EcXLPJcS8KUcC+gIVkyrB6oy9n9g3FTVbjhbt9Fl1wwyrUawR8mXwlW
	 WaSGloSs3sQewp8R9Gh+vqzOlrT20RJzPNOQC7dZafC604ntoy8YflAqAvREAQc249Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191761;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UE3cxh4Yaz2lcwnzg8DWo7tmNqwhg5hgieOdXzNGseQ=;
	b=n0hJUzUtQyX52WQI1/i4g8Sr9QaS7i3vmihhpYwq6B64S8T9LIEkMzfyOfxQMj8Dl0bN
	 8G/SNh1/CA9ziBDAUD9fE0+cav9BYmtrSQ2HBvYKDkMI2QONxDjIaR7b8W2vAL1WRj5r4
	 /KJkHbSg0za3CLmpaPOAKSPrMOtcVBTwIHVyHnpYagURhp0nPupdSqGxkWcL9y5A4KnHK
	 8wU5FnPgvTflkNnv3MDIrIRLLjzdMUiFDPBUca2imHzr+baC5Mk7UE4GlTxGc0eBtrbaw
	 fFuF7SEYyXQQ5Rv1Bo6sLh/dtbQf5qj+ZQLjdqAL3VTiFo+5DBH0OVcxNKrAuOdmlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nflnBQL8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C41606A32C;
	Fri, 20 Nov 2026 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nflnBQL8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288541F000C4;
	Fri, 20 Nov 2026 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191761;
	bh=UE3cxh4Yaz2lcwnzg8DWo7tmNqwhg5hgieOdXzNGseQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nflnBQL81CdjNgAQ/lYDvapKo5OcUiVI4zN9sTkwdiIFXd8pW8MXDOa9wvWqdaa41
	 sHBV7NtHqfhfVlJH9JLag/DchbMUcKhjoa3iuWEdBjYy0juR5TmfdmYoqFR7ms6P5o
	 GaXOcm7lJRjo2FhAKVTxvhxAuS674IKTgf6BoHZSyaYjj7JGdYis43gk9MZCLSdSwU
	 tRZM+J5OPDnGq0ycWPdgwZyW8enoCqC9SExG7mc7LUdHrHLFEwOZ06hrY5nJNFLj8s
	 BmbtyP9Jzcu8wmuoiCQnlXClLCcttWsei4U4XorcCNnisPO0WhlTGY6aF+tUktypZ2
	 eL40/Fqy3PChw==
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
Subject: Re: [PATCH] ASoC: mediatek: mt6797: Fix runtime PM handling in
 probe
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, kaichieh.chuang@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
References: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
Date: Fri, 20 Nov 2026 16:22:36 +0000
Message-Id: <179519175666.6016.11644366244582649083.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8U4fievZtT0npUDmkK6cNO/Z30hCYZ+2JMkBYDIrwIM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZis+Gmv6WaOzLW7eycOnnooypgcvdwiRPyLodWDpd9
 4HSzKuCHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIqT+MDLtCako7rhWJpCn/
 zP+vtIuRYfvNpfXaLyuLXUrENWvUGxkZPvGe/PA2aJnbGR5Ftj3BCkbsmXyP32rmmO9XnbO27aE
 nFwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The MT6797 AFE probe registers its components even when the runtime
> resume fails to enable the clocks. If component registration fails
> after a successful resume, the probe disables runtime PM while still
> holding its usage reference. The runtime PM disabled path also
> returns the previous successful result without registering components.

> @@ -846,11 +851,13 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
>  				     afe->num_dai_drivers);
>  	if (ret) {
>  		dev_warn(dev, "err_dai_component\n");
> -		goto err_pm_disable;
> +		goto err_pm_put;
>  	}
>  
>  	return 0;
>  
> +err_pm_put:
> +	pm_runtime_put_sync_suspend(dev);

There's a race with userspace fiddling with runtime PM here, it can
force runtime PM on.  Instead drop the reference with
pm_runtime_put_noidle(), disable runtime PM and then directly call the
suspend function to ensure the hardware is i the right state.

-- 
Mark Brown <broonie@kernel.org>
