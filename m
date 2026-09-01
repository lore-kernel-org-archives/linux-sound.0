Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF623CB579;
	Tue,  1 Sep 2026 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228595; cv=none; b=Y/znhpkxyh+PsC5/V65HwhPnFQqG4327iCHAQE9D6fcHQI/8mlEYEugu6mlJF+g/+bG22z5ow/GB+wTejUDgiqsdhfcwb7xLoODhbJGLYOLa5Yp+IFeMOVeqMoXdk2lZrcbVQ781soUuRaPgPWsPJ/Zd9pbuQEVsYraAGO+5XI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228595; c=relaxed/simple;
	bh=ep0z8IdghvzdbYOB+Nqpk39AXdEfP04Ly9ZL+Vg02Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DWkw0xbIsrmOmPfIwwPjRNRYkCzQjdZpxaHr/rvWDbnpMLgG/xlKkWEkALHeJ+xHgsPyfyjoGs9hsRX+jgnASwRhZIcw+WXiGgd5MXvRWlqVzJI6dC10Sl9VNfjgS0LeLKNuBxUZ1xogp7J7bLSRhdGhgW0Psq8HaLBi/sDKg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU2YMHKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU2YMHKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D581F00ACF;
	Tue,  1 Sep 2026 02:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228583;
	bh=5nO8v8byw+IxlzlJ4gQShYL7eX9Q0YJoVtHWldSXo9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VU2YMHKWgEeCdAH6Sq+74lEf46nCLMBVQ55mFFeO7iXp3rEs18nXJLXGH4/NgTUxi
	 w318mLN14fvL4KtIi8KGDHx2xwmRe9X4QJ3xkDf1V5YAzQOKt7dZ7AOghSpFbInIH9
	 E/MS3E3UXautzyZGh2pe0ar661nGvpbNHvDmIeRRyEdN9p7flEaC1OocrTliNyMIGP
	 LPZNix/3cZkrwya/X5E/XUj7HC5ZeNxtIWPhsc0FlvCVOo3RvGfF2KO+0D7k95haga
	 PKaqfFB5EQ6ziPk+X+eY6MOH8HsVwVZDo1qnCxr3qt/yH47Bn1iEKqqxLW9N4AKeAA
	 LZ8Sqae1BFSCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Hongyan Xu <getshell@seu.edu.cn>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] soc: qcom: apr: clean up failed service registrations
Date: Mon, 31 Aug 2026 21:09:21 -0500
Message-ID: <178822856284.1835959.10858628991542042606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806060541.820-1-getshell@seu.edu.cn>
References: <20260806060541.820-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Aug 2026 14:05:40 +0800, Hongyan Xu wrote:
> apr_add_device() publishes a service in svcs_idr before parsing the
> optional protection domain and registering the device. If device
> registration fails, put_device() frees the apr_device while its service
> remains in the IDR. A received packet can then dereference that stale
> entry. The property error path also leaves the service and allocation
> behind.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: apr: clean up failed service registrations
      commit: 7dc14f37ca4ee35040c67c4b0180dd7b32079caf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
