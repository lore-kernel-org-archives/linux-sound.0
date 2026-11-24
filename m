Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557160;
	b=tDe3AEGULuOvbJ88TvR4VcUrCH50Lxshl+l9LxFmtCbig+EW9EhdvTyvi4wYm+6oBsN4
	 5dNB/1bzYu4hUJc+GP4zfmEXXlx9/ZhzAF8ECtEg5dOR2MW6mYgEwoGmQxQ4z7hWn+qxn
	 oKft18bKg7yW6xdr0GYZ4m4W4cv/0nQ5fCSM8oqiJ8qFrUjqEAVZ8PCRBmw043co9BXUN
	 byVJGzBwrPQH7fLqgEzkbaSGitPGe14oVTwrHn44/Fjn93gM8aMrxmTJIqib9plVcchnD
	 w+rB7eQa+dQU/NsTi/y3I9Frcl5jqTr9pJj8hknlHHnG0fjDYYyJcAW2Nn+T8dRMHvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557160;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IIJX5vN2IVNysBWVqi7H+2QNx6RFv36WNEJCnHNtBJA=;
	b=zYKn9RMVyxVm+iXE6g5NSPZU4aqrJbttTUMhLvxto0INk2/2/b+xq8r/V6m8i/WcCllB
	 7oC2nQR99A+UirhzLSnmNsPqFOEGLeNp3buDPmuMSz0GOadgmjpEEqtOekdB1d1uovdcK
	 bgmRaJ5UF2i8axRmg1Pz7CdwI+iuMaUkQF8iDQzY/TqCnMQSXyuC3prjJJaMv0kmQ2wZq
	 RZhwtX0cVsiJsyqyI4vsjNHDVQVSVTxJg4BMA3idyRZ6Lky0CSvXAN7QHgtgsuFH9iCGF
	 NScp2onw6VnGb/1Dl05vENOwQTdnRW4pa/A9qbp4m7jcDgIGB5ghV0nlitqHgB9Mpag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VArG2sKD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6F606A333;
	Tue, 24 Nov 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VArG2sKD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8B21F000D0;
	Tue, 24 Nov 2026 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557160;
	bh=IIJX5vN2IVNysBWVqi7H+2QNx6RFv36WNEJCnHNtBJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VArG2sKDK+v2OTMBkcc8zhcFBZhE/b8l7opMXsRIaNHB+sYawhl5Oan76wFjjuxTe
	 0CUwj25xRMttvHNswoPLZ7UUoxq3LtWUFzPpB+0VovOvBHlQ9Nk0vNuV4LM+N7+6Sa
	 /8O/i+FHV0PTzbSPb1mfMhRubNYnXAWvxYCxWyBvyHgCAmeBx/jRUQ9gzjinktX7LG
	 dCAP/+pkk/Nf2i0FD5HMGdcjCdLxm9A3stHyGNxDsoDIaPSEet0UGqX5MJ0sLdkmPt
	 BMT36ZidgWtXCf1Up54HLRsIpl6txQZtk2BMdW/DrcspasaTvkHmXVdeaxSSKO2GCh
	 w2rIlowoFe/4w==
Message-ID: <fe905aca-2b32-4076-a7b8-949de8b34d5c@kernel.org>
Date: Tue, 24 Nov 2026 21:52:38 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: put the child platform device on
 unregister
To: Wentao Liang <vulab@iscas.ac.cn>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20261104021427.1468218-1-vulab@iscas.ac.cn>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261104021427.1468218-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/26 2:14 AM, Wentao Liang wrote:
> qcom_slim_ngd_unregister() only takes the child device out of the device
> hierarchy with platform_device_del().  That leaves the reference taken
> by platform_device_alloc() in of_qcom_slim_ngd_register() behind, so the
> child platform device, the resources attached to it and the reference it
> holds on its parent leak on every controller removal and on the probe
> error path.
> 
> Use platform_device_unregister(), which also puts the reference.
> 
> Fixes: 8663e8334d7b ("slimbus: qcom-ngd-ctrl: Fix up platform_driver registration")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex

Assisted-by is not a valid tag anymore please run checkpatch before
sending the patches.

--srini
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9bee4b376877..9f24fcc5f0e0 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1641,7 +1641,7 @@ static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
>  {
>  	struct qcom_slim_ngd *ngd = ctrl->ngd;
>  
> -	platform_device_del(ngd->pdev);
> +	platform_device_unregister(ngd->pdev);
>  }
>  
>  static int qcom_slim_ngd_probe(struct platform_device *pdev)

