Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012267;
	b=DfT77OV+BqhvG9KKh04xByyD+jyYkOpdLl/xTZvuHF0yWPoBvUFpr14jX9QDV1Q0qoXE
	 XwMrx/9Jcvh1iVOo9g+gNvX2uyMpKDSCVXMRVrMtTCvk9SlpBt3T2Jqydcp3bJmav34ub
	 xf7M/NTT5Cn0+/oIqyXPbB6+BVwFxiJtpQhA/y30YtGeEw4Ho8uJFDKapEQWhy6THUkFB
	 n8PQouVmW/Ruo92Wibyg+cnFbYBZQJYtfHV6bgRtV9kEbmdmxlOGqKrVZNcskxLEM8OYA
	 udnzJBYQcMkOiAuk5FE+n5/SGio3BPggNfV7B3OGyo/nBvUa2Phwsk2v1O/o5QogSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012267;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=azxVHFU3nb4yj6U10bqmp7ezQdZt185MzFbO/ZfWcdY=;
	b=MQCHS47D+HBdUGrwigsETJvOn9rl0dLlFOg0xNxPe7FEUvr6p+p4LuvuZ5dTUs1RyoZ7
	 AErbgyD/Hh4DYSEuMnPAkgGT2GgwBCt1iCNskYvdi0poASz1BbWWqddWi/IKn65fn8gOC
	 5jC+5TOfCaRtErcGqDFEhJtjm1mTu5SBLlueNNW4P0nxpXwfCzgRKntv0xMJImLBYpPXy
	 pk1rIPzeJaRtat6FkG9I7gj1CdcvJJSmkPbEg0cmXlrcQ4FgK9hMgeJepN93ESQ79W9Ec
	 a1jFwq9AKU6q3ktDginT1F2ZKags/H/krcWWq4Sd8+ZxXvuChkfqyj3iP9SuZvage5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ds2jypTp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A81606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ds2jypTp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE0D1F000C6;
	Wed, 18 Nov 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012267;
	bh=azxVHFU3nb4yj6U10bqmp7ezQdZt185MzFbO/ZfWcdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ds2jypTpY2W45WonB3mr8pwLBeW1UJ0V72D4A27aO1dBeokp3qRfowW7bjPc3hZ6u
	 ydHK9rCZQAyxoeU6YjMxo1m3M/9LdLVl/zd66+tHxSkS4E0XhuBNJeGEFXxLQb2gxj
	 zjjlZfiH3FGE4S75cqjrdcb0omTQrOa7cEPMWD7ca0mV2LJXeT8IL7AKeBlubCZb7o
	 T7/mfphwI3Q/NY88udbkoaxpCylxwQE5tFKc2FY5nQE4sA03IN2v53JBecTbBUmTVn
	 bmEKWqzXyTOQT4+oICPSlk9XBtXDl2NcKnk6JzpmRHZ0mbJDEwLVU9vETBQdDTGZYE
	 ZreX1mF4Xx1IA==
Message-ID: <sashiko-outbox-221213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Fix potential DMA buffer leaks
 on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261118-324f82bd41-slimbus-qcom-0@mail.sdu.edu.cn>
References: <20261118-324f82bd41-slimbus-qcom-0@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:31:07 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] slimbus: qcom-ngd-ctrl: NULL deref and UAF after
  qcom_slim_ngd_exit_dma()
--

commit 2b691a90537a94bfedb91b63d4fb5eae146f115d
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

slimbus: qcom-ngd-ctrl: Fix potential DMA buffer leaks on teardown

This commit frees the coherent RX and TX DMA message buffers during DMA
teardown and clears the released DMA channel pointers on initialization
failure.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index eb983b6d1815f..e604f4e2b7624 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c

[ ... ]

> @@ -1210,11 +1214,19 @@ static int qcom_slim_ngd_exit_dma(struct qcom_sli=
m_ngd_ctrl *ctrl)
>  {
>  	if (ctrl->dma_rx_channel) {
>  		dmaengine_terminate_sync(ctrl->dma_rx_channel);
> +		dma_free_coherent(ctrl->dev,
> +				  QCOM_SLIM_NGD_DESC_NUM * SLIM_MSGQ_BUF_LEN,
> +				  ctrl->rx_base, ctrl->rx_phys_base);
> +		ctrl->rx_base =3D NULL;
>  		dma_release_channel(ctrl->dma_rx_channel);
>  	}
> =20
>  	if (ctrl->dma_tx_channel) {
>  		dmaengine_terminate_sync(ctrl->dma_tx_channel);
> +		dma_free_coherent(ctrl->dev,
> +				  (QCOM_SLIM_NGD_DESC_NUM + 1) * SLIM_MSGQ_BUF_LEN,
> +				  ctrl->tx_base, ctrl->tx_phys_base);
> +		ctrl->tx_base =3D NULL;
>  		dma_release_channel(ctrl->dma_tx_channel);
>  	}

[Severity: High]
Can freeing ctrl->tx_base and setting it to NULL here cause a NULL pointer
dereference or use-after-free in qcom_slim_ngd_xfer_msg()?

qcom_slim_ngd_tx_msg_get() computes the descriptor buffer address from
ctrl->tx_base without checking whether ctrl->tx_base is NULL:

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_tx_msg_get() {
    ...
	desc  =3D &ctrl->txdesc[ctrl->tx_tail];
	desc->base =3D ctrl->tx_base + ctrl->tx_tail * SLIM_MSGQ_BUF_LEN;
	desc->comp =3D comp;
	ctrl->tx_tail =3D (ctrl->tx_tail + 1) % QCOM_SLIM_NGD_DESC_NUM;

	spin_unlock_irqrestore(&ctrl->tx_buf_lock, flags);

	return desc->base;
}

When ctrl->tx_base is NULL and ctrl->tx_tail is non-zero (or on the second
call after the first call advances ctrl->tx_tail from 0 to 1),
qcom_slim_ngd_tx_msg_get() returns a non-NULL small offset pointer, which
qcom_slim_ngd_xfer_msg() immediately dereferences at *pbuf =3D 0.

This is reachable when qcom_slim_ngd_runtime_suspend() calls
qcom_slim_ngd_exit_dma() and the subsequent qcom_slim_qmi_power_request()
fails (such as with -EBUSY), aborting suspend while ctrl->state remains
QCOM_SLIM_NGD_CTRL_IDLE with ctrl->tx_base set to NULL; or when
qcom_slim_ngd_runtime_resume() returns 0 after qcom_slim_ngd_power_up()
fails before reinitializing DMA.

In addition, qcom_slim_ngd_exit_dma() frees ctrl->tx_base without holding
ctrl->tx_buf_lock or ctrl->tx_lock and before ctrl->m_work is flushed, so a
concurrent transfer can also write into the freed coherent buffer:

CPU0                                  CPU1
qcom_slim_ngd_xfer_msg()
  pbuf =3D qcom_slim_ngd_tx_msg_get()
                                      qcom_slim_ngd_exit_dma()
                                        dma_free_coherent(..., ctrl->tx_bas=
e, ...)
                                        ctrl->tx_base =3D NULL;
  *pbuf =3D 0;  <-- use-after-free

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-324f82bd41=
-slimbus-qcom-0@mail.sdu.edu.cn?part=3D1
