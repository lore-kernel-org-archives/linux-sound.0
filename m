Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F99045BD5F;
	Tue, 31 Mar 2026 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997647; cv=none; b=PMlrGpiE3BQ2+VRXLx7lALwolvcqtxLBdxuuS08YhSpC+BW9Ts0GdMwdDFZx2+fdSgIJsGeGOxyAuSTDRRenEtukp9bD4OEeDP8VS2s542+i/78yCCGEVDSzb88sy3lgK+7tIX3k/oUFE5uyijACxzSDx42kajI/VQMLmC42B1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997647; c=relaxed/simple;
	bh=hR4RvH7SKgLo5Wz7Kf6cZunjUHgU5I1wjNV1rA3IMp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/CtoOVEawSdZv+uSMZANzMiBa+nCuPIRCPL/z4XQ5cctWXVFZT9OAVgcMeSJcKjy8xguNmiUUjKgLA+O3F7ezJ/w3vIFWWBhJIzFP8ntemmGysyoVVNz6bHW/C5RNjZDdFqIgO5GZbqfMI75pOrXetpVc+WYfTX/lAoKhbbe1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKV2BkQv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKV2BkQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076EBC19423;
	Tue, 31 Mar 2026 22:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774997646;
	bh=hR4RvH7SKgLo5Wz7Kf6cZunjUHgU5I1wjNV1rA3IMp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKV2BkQvP+cMuHufNQ7Zj7xsjktfKleHzkcsApPUX07T1xOgB5Qo2Nf3+77r2swYQ
	 ed1CiC+6mSIb5HFapxkbhlUdVvdyjhOdKl5wU61Af+cMf/JiCFfFPvZLG1L6FF6jLP
	 tO6hiGn39axBAydd31IAHIptMkVXC3hEn44KFAV1J2p8utPkjuD2gbomjS82iHzo6P
	 LcoIlEClukNQBx8CX3bK02w0iH+l/djR+73CIi5RGzsVuzF005pIiXZoHq4yIuQcmA
	 tVHurrDx3FnGuyuAgswAeuIA+Qmz6VAjIo7f64GT3tbotv4R7Am+/7FwJSuLt/hP4T
	 jrv/ACQRaMOoQ==
Date: Tue, 31 Mar 2026 17:54:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Message-ID: <acxPWJY-C1DUviT6@baldur>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
 <fusum3ildpm2epfipamzlttb7oyopua6bt2rl2kfh6jjtl52oc@mcy5rcbpim7i>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fusum3ildpm2epfipamzlttb7oyopua6bt2rl2kfh6jjtl52oc@mcy5rcbpim7i>

On Wed, Mar 11, 2026 at 03:34:40AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 11:09:07PM -0500, Bjorn Andersson wrote:
> > The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
> > supposed to be balanced on exit, add these calls.
> 
> Use devm_pm_runtime_enable()?
> 

That would extend the pm_runtime_enabled() time until after
qcom_slim_ngd_remove() returns. I think that might be okay...

But I think we should continue this cleanup and try to clean up the dual
platform_drivers in the single driver. Also the PM runtime callbacks are
attached to the NGD, but the callbacks are exclusively operating on the
NGD ctrl (i.e. parent) state.

Regards,
Bjorn

> > 
> > Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
