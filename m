Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964E1367;
	Thu, 18 Jun 2026 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819131; cv=none; b=nrsXwMN0LB8bNE8oH1l4mv+aB7QWnxDJVsgPhmJV+ZH3T2SwjkTAxlqQhNqml42Rk7ZmjW11UMr2nc3F7ceGyikyK0H456AoHlju04d7LUSKnMWRreg02EnFLc/KBWV5ywxJud29lMlPxtl/ul2SJlemQPMl9QNzqrI7V1CIUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819131; c=relaxed/simple;
	bh=oNQ7Nj5q4VgGEtdWos8dGriV/tmuPTWCWLbyXtQR6aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIgCb/BayXXXUgGgexB2wL5Xsvqj/3umvI/l7LogL6Yy4DGS3Z6AqYEaiexpp3P5CGeXDjqCsS3xEgShkestRoGWGLq7DjwIkViiSeOnIMcbCxEYIv0tOqiqVHgeu04MKP3rpbgzo1vZTGrVtQMMguIwg/Z/cstimhvyB7XMaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEZZsAkR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEZZsAkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548BB1F000E9;
	Thu, 18 Jun 2026 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781819129;
	bh=3PO8eK5t/qadih/zDtj61rkREDX2jCZNqbr0c9h2Wyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IEZZsAkRSixW643QnQb934xnNlYF9WBW3d0fsl0CBP+6IBaR8FicVFvEZPlpi6G25
	 slrs2Ixhgv1ISzJFs1gCNsb3D3a+wEvzUMHFq1X2gMzXj2Xcbxv+YqZLF/k4YQcWJD
	 BMcyCaz1GEBRMyirCDPCWfP0jSTOyKUxTK3z7WcaYqrwinC+JZJVUVEZaljaIFFn4C
	 m3sFNf6SNZmcRrM3PCzHB+qEphHmMaE1ZWBtZD1xcOsOInq4zJL0BPM/nYZUw1Ojmv
	 8Uzob2LrVzHlhyBLzXuAQEgm5UHD2hVKLkihxtcfTPgYg2ze1yYvmRQhKT0iQSPXUV
	 y+cIkIgnoFJMQ==
Message-ID: <02eee0a8-8c0f-4b0c-acc2-05dc436e5a85@kernel.org>
Date: Thu, 18 Jun 2026 22:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mohammad.rafi.shaik@oss.qualcomm.com,
 Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260609064038.492641-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 7:40 AM, Ajay Kumar Nandam wrote:
> Use each GPR domain advertised by the qcom APR/GPR layer when building
> APM/PRM packets and add explicit dest_domain parameters to all AudioReach
> alloc helpers.
> Legacy helpers fall back to ADSP while graphs, media-format, and
> shared-memory packets reuse gdev->domain_id for modem targets.
Why?

> 

I dont understand what are you trying to do, commit log itself is not
clear and does explain the problem that you are solving or what exactly

> Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
> Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 112 +++++++++++++++++++++---------
>  sound/soc/qcom/qdsp6/audioreach.h |  23 +++---
>  sound/soc/qcom/qdsp6/q6apm.c      |  48 +++++++++----
>  sound/soc/qcom/qdsp6/q6prm.c      |  19 ++---
>  4 files changed, 138 insertions(+), 64 deletions(-)
> 
