Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE31C68C;
	Tue, 13 Aug 2024 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723522980; cv=none; b=EfzNWd/cz53uMRSJZpjxwst736SqEKwWoYdCIEC9T8j8kh0iMAM9mNHpgRs19OC+lvOBuwLuExK4Jw9I/u0T/uhY3ZMn+e2oUSFdzyF2IyF7wi65b1VZJautP5JVhmpWGUQT7b+23RlCy70wKOk7LXTfSxXT1cE2NhzhJVudWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723522980; c=relaxed/simple;
	bh=wpwi0ABCpp/fgkqrTv1+QuSZw7VZSn7T7zdqlyzHuzE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bCrYvpY6AcroEGGqXlOYayXjRH7YDUaYicrZ1qdJ6M2OipGCcPVMuNaoibl3l7T6SelIUKCiKKUYRR+TfjksjmJp0sn10kMlVHHum+Z65cwaPaeRKcmBzJK2e/TKmQPNPpbH0PLVGs6Fict5UiQF49nPh/A7QmwCXZ3mU+zmvMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbuFRMU2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbuFRMU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB382C4AF09;
	Tue, 13 Aug 2024 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723522980;
	bh=wpwi0ABCpp/fgkqrTv1+QuSZw7VZSn7T7zdqlyzHuzE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hbuFRMU2cxJKNWakFAu1FeNWOGPlUJPWqiBrM3xL4n4TTmQO2j5LTDpgXkE14Vypm
	 GiHp5tlytZBsFDe/bi7SSADLkl5TTvWUUoksk3tzmYEsvnpSE+SfBgBueKpP1o9tmu
	 Zg8XIVQZHecwg9ApAcvKaXk5WEBdsR25zTRRHRNwBqKapmLJb5qp7QQdhMiN0qfLTU
	 LkAgTxEV8mXibgc/lQroYwino9fcca9vBaewCLjxysyUd0tYcFaNHjFu8fV9/D10KE
	 1v/HvOPvs3qkpJXRpE0Wn7CbsDWsjGGesBGklkjZPOfWSF2bKL8MhsBhCJlZ4ZDfd4
	 fB+NKC3lceyfg==
Date: Mon, 12 Aug 2024 22:22:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20240813025436.52410-3-kiseok.jo@irondevice.com>
References: <20240813025436.52410-1-kiseok.jo@irondevice.com>
 <20240813025436.52410-3-kiseok.jo@irondevice.com>
Message-Id: <172352297724.3355027.16490098797646859934.robh@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device
 SMA1307 amplifier


On Tue, 13 Aug 2024 11:54:36 +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  .../bindings/sound/irondevice,sma1307.yaml    | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml: use-binary: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240813025436.52410-3-kiseok.jo@irondevice.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

