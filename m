Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758921;
	b=YUTOTXFH85YU/sGCgjR0ixm0W0VnkT5HkVhRAOotGVP0gW+repVMTmKaUTevHOwEaOZg
	 J6h5o/Lm9MEf7iQ+BuSYHZFa8AqnDe11zUHo5BtxCykCbHWmd7PstNfuNnSJxvX6F/Xeu
	 hw2RMYauKXeJPXs0lbDNVOiSfsR8xwtWFyofWlccVULalkyxHd9FlECp2Iwe9fwJjBKm2
	 iwCF2PqWv4NZe8n4fzUFtn5FHgiInrRSULALOtcAPSaqO6NBUoqzj6u4NFFSqZa/CVd6K
	 eZWUb31fLzlBVu6efj8JF5eXth71NypxghbRodfJ+SNbFeQ6TDLalLPuKN1Q1IFJbwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758921;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wduqqznwFdwM4/A1mBx7ra2HodPQY2NKe2CIrZ5bscg=;
	b=h/xOedY9D+KIvAULNL7l7lIJ6AmmDUwTH2urSA6rFQQkvKgK4LEXs5ju5qOnmoad/+k5
	 MDZGnw2s94GgagSZatFLbHLwgxwOlK5L/6gzXSEJZA+J9Sz2jv9k/9Ks2alzW/Ogy6MUL
	 Atai8CGhJyQolMLFMAxFFlxT7kDZO6Yd5TfUQcWzi3odlGDwJ5dC++AgVRo0fqgOwGMon
	 jh/jw1mYHrQiKsHTtSiZFHMCG8Uoo78gbKlVTi0NrmU7KjL4JRkifIO7GDtZ3iXh2KsAN
	 JtfOT20HJGqB01hbO144f77zt2gT9J4WC5TgJ3k2baTplSY3+O7Nxc4xUIlryY0w5kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTJpKD8X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F30606A32E
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTJpKD8X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6074C1F00A02;
	Wed,  4 Nov 2026 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793758920;
	bh=wduqqznwFdwM4/A1mBx7ra2HodPQY2NKe2CIrZ5bscg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XTJpKD8XiYhUcnJucKM1tCt5hljNPfgLA+n/IVj+QEZ5N7YEpr6HFMRKDQdCzDL2B
	 gWfJPcnCQjcS0F6GAOlQDoDTbpuepuAcU5OD1msHoLQt6edYOekkpAX64xSJWDwrFj
	 q23boZNkcxkITCqNq8s/O6jS8OFhm8WPWP7j/IDLixhjh5Hu0em/k4PsPnGtOx2adC
	 HDWGe9fl4Y5A21KhhsKmQEMDRgm26ARg91EEprr4IKJMFMn340xGhnTXcPRhYfhBYc
	 JdrAbrx8Q15KT9CuoF1mxvG/bIfMZ5CRs0Ja+nj7Z924+zQtuNbtgGKPbUnTDFyPWk
	 fR2m2jWv9PYXA==
Message-ID: <sashiko-outbox-196442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: drop the PM runtime reference
 after a sync transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104021424.1468172-1-vulab@iscas.ac.cn>
References: <20261104021424.1468172-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:21:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] slimbus: qcom-ngd-ctrl: runtime PM underflow in qcom_slim_ngd_xfer=
_msg_sync()
--

commit 95f275b622c76bd63160fe6491c0337ce83609c2
Author: Wentao Liang <vulab@iscas.ac.cn>

slimbus: qcom-ngd-ctrl: drop the PM runtime reference after a sync transfer

This commit adds a pm_runtime_put() call on the success path of
qcom_slim_ngd_xfer_msg_sync() to balance the pm_runtime_get_sync() call made
at the start of the transfer.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index eb983b6d1815f..9bee4b376877e 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -942,6 +942,9 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_co=
ntroller *ctrl,
>  		ret =3D -ETIMEDOUT;
>  		goto pm_put;
>  	}
> +
> +	pm_runtime_put(ctrl->dev);

[Severity: High]
Won't this underflow the runtime PM usage counter on ctrl->dev after every
successful synchronous transfer?

Every caller of qcom_slim_ngd_xfer_msg_sync() (qcom_slim_ngd_enable_stream(=
),
qcom_slim_ngd_disable_stream(), and qcom_slim_ngd_get_laddr()) allocates a
transaction ID via slim_alloc_txn_tid(ctrl, &txn).

When the reply or ACK (SLIM_USR_MC_ADDR_REPLY or SLIM_USR_MC_GENERIC_ACK)
arrives in qcom_slim_ngd_rx(), it invokes slim_msg_response(), which already
completes txn->comp (&done) and drops the runtime PM reference:

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_rx() {
	...
	if (mc =3D=3D SLIM_MSG_MC_REPLY_INFORMATION ||
	    mc =3D=3D SLIM_MSG_MC_REPLY_VALUE || (mc =3D=3D SLIM_USR_MC_ADDR_REPLY=
 &&
	    mt =3D=3D SLIM_MSG_MT_SRC_REFERRED_USER) ||
		(mc =3D=3D SLIM_USR_MC_GENERIC_ACK &&
		 mt =3D=3D SLIM_MSG_MT_SRC_REFERRED_USER)) {
		slim_msg_response(&ctrl->ctrl, &buf[4], buf[3], len - 4);
		pm_runtime_mark_last_busy(ctrl->ctrl.dev);
	}
}

drivers/slimbus/messaging.c:slim_msg_response() {
	...
	slim_free_txn_tid(ctrl, txn);
	memcpy(msg->rbuf, reply, len);
	if (txn->comp)
		complete(txn->comp);

	/* Remove runtime-pm vote now that response was received for TID txn */
	pm_runtime_mark_last_busy(ctrl->dev);
	pm_runtime_put_autosuspend(ctrl->dev);
}

Because slim_msg_response() drops the runtime PM reference when the response
is received, only the error and timeout paths in qcom_slim_ngd_xfer_msg_syn=
c()
(where slim_msg_response() is not reached, as handled in commit 63c60a226c9=
0)
should call pm_runtime_put(ctrl->dev). Calling pm_runtime_put(ctrl->dev) on
the success path releases the single pm_runtime_get_sync(ctrl->dev) referen=
ce
a second time, which can cause premature runtime suspension of the controll=
er.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021424.1468=
172-1-vulab@iscas.ac.cn?part=3D1
