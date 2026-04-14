Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B33EDADA
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184116; cv=none; b=Emrty9Z19Kxcc4Xei1l63dFhG/MLLirRN+OBr9JzzCXHnXk3BJoLYMS7Hox60WOy2VvXOqIexMYqq8n7M0H/vkfOcCQHLJIWJ+8F0jynGzPelmM+kjh1yoeDbQE+ZFAvn2tqFUEOuf0shYAE+I0/L7Brp5s6XYPx/eH/LA/JJMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184116; c=relaxed/simple;
	bh=WtxpR3VMa7SGRjZmUceh+dFtarwxsu2no5AtO0o88Ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hn7N+wRf6aLC5TVx9euYYEBWWbA+vXfDK9gXdc0O4wgI9Qa2G71VHo7JCSpz0HhCpMl0tGpUssTQAEE29GalxQPtLt8u56L1FlIIuGeKCokjMRlSbZ2fuwtsAeyog4ccBZN1a1RTfhMW1ln8CNmpLC+RhLo3C8jikxe0C29obUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pf831A2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pf831A2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBD8C2BCB3;
	Tue, 14 Apr 2026 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184115;
	bh=WtxpR3VMa7SGRjZmUceh+dFtarwxsu2no5AtO0o88Ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pf831A2MZ9TqynxVU9/Xun0p4GU7BIp5f8NwU+RMfeE7RhICADafZ3FwfhZ+7cJUG
	 VGupC09b4uagoENEGW6DlWuE6b1mTmldbcShdbO6ULOuh1mkl5fY/JD9jn107Km5qj
	 KbSM+jnsHRwoZki9acE7Eq0OmAmj8dWdb5vOHJ4rAAJCacCtyyDw2Qr4mMMSDe4Z1L
	 WbHjEaELW4YgocdiebGxmuJuCauw3P/b0dgyWSVrHNUpegUK+u+QJHBcKgT4zzDXG9
	 6ZX+yE9rCpibW7cMD1hu+lBGDUo15TDJOh3qB1PQtmeQ/Xa8ys1r16o0qFqw9kPwhC
	 lp1l5QOoS1bzQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
References: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: NVL/NVL-S: add platform name
Message-Id: <177616724495.46569.8549625903131972752.b4-ty@b4>
Date: Tue, 14 Apr 2026 12:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WtxpR3VMa7SGRjZmUceh+dFtarwxsu2no5AtO0o88Ws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp3msxMFIaBwC1bN3KBj+5vL4z0pfNRk89bmn+u
 sFXlDxrwueJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCad5rMQAKCRAk1otyXVSH
 0KkLB/9xGE36PJ//FheTnKAxFF9Gi05vSn5LgnsUhbgKXeSyBiw56eUWV02Kv6MtwGEZhFWcEfD
 5EkVoUAx/UFaDHD6/wzgHBHURXi3fC67qYQwgzd0pXgTdQe34wibiAHVAbPyzgBjR1426hfT9S5
 2CjwJi0z7ZtwUFTvObep9tjf8KfxijZfSmuB+F/plRSRZd5fNKzKIyxr2w3uIzJ8Y0Um/1Xb1zq
 JLOm7t74urmCfz335n1/0bWoDGNVmRMIBPZwxLgKWrXPJ+qkF7xeOklRRBKqi6fG1ZlTfH/pilJ
 ir9jBJDcWmyjPjpMeCFq0k9yWQKWnmuMNW4c6h2Uu0Dko8JP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Apr 2026 14:07:58 +0800, Bard Liao wrote:
> ASoC: SOF: Intel: NVL/NVL-S: add platform name
> 
> The platform name will be used in the topology name.
> 
> Bard Liao (2):
>   ASoC: SOF: Intel: NVL: add platform name
>   ASoC: SOF: Intel: NVL-S: add platform name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: SOF: Intel: NVL: add platform name
      https://git.kernel.org/broonie/sound/c/ab463b465585
[2/2] ASoC: SOF: Intel: NVL-S: add platform name
      https://git.kernel.org/broonie/sound/c/a158fe7b0c81

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

