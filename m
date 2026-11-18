Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000266;
	b=MGKxbLP3xTEhLlHVtN+wgVd52B1t5n5ew5CpwfLmelJxJztCe+EwcV1g3HG/MeNmhwqb
	 8b2FEqgIbJyydksKKcgUj7FmubynfxjoZPl6IQEst7La6/JkNJFpochwTMgfSCYBz/EEa
	 QRdeDE5caqqVE6uYqGU6WNeijEEGufXqnxmU2lAL0Pjl5xghoQJb11T1sE0YvfJTp7wVu
	 bvQvxyfdzUaimcI6vh8gGTY9RmNWavSKEQmlLsx8nwGbMQdr3qbI5fFIQNzWSbVnYUoZZ
	 lEn8HV/I0m+zUZ8aw+tdPoySJRVqqymPTsESFOHa5Y0GTuPXtaBBG5MP7UDCzqUWXhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000266;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5wNxH4Lgc3EOsXViHS/O1SOxEKCfh3Nqhg4BIuQ2cqk=;
	b=36xNnnQPj/pPKZNStlcKUKWRiGE9g7u1E7eJhP2RPHDvQlDVRrsKpVcbL8/bdRpY0o3W
	 +YpH0EQdi9g5An2763XkvdoZDP9T65DdRcsaWNUCHbsgjVUvrZc+DecX2vRtzG79jtTgq
	 cr4gZAXbd7b6nhvjiM85Yfhy5am+M8tKD2+P1+xzBUe1CVpAhl3xt5/RmdY24WnH+8ltj
	 7lLu6TOhbaRJEDKewkGEOlkcELO+eUG1/PJitO4wPQkBs8bD7f26M3h7YAXO9OFJTIXpr
	 /zQ8Do0fJv6A6Jzixf5dbYYSEpD6VhUjIfZkGU2jCjsmGBiJNWWrEOA7FMTGCXvoJbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YV29bCW6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D585606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YV29bCW6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1253C1F000C6;
	Wed, 18 Nov 2026 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795000266;
	bh=5wNxH4Lgc3EOsXViHS/O1SOxEKCfh3Nqhg4BIuQ2cqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YV29bCW6UBoMBuy6hRiRXtPCrVj5Wa4e9KnbxKresdCkOtbyFuqQsimteEM0Qy2/C
	 pJR18nwX28t67mSAi77EK0wICBfJK2tExTfxDiN/MP1NyNg9R7UlCot0Uh0XZmyreC
	 6scouA+vIuoyCbLq7HTMQ2Gz1UcM4CeUNYXyTM9EFJmH2JvHrMOee4Db9RHz2xYyvs
	 GGhVFZbxSbZskNbvPizt4irQGHo0MYkSBZOU0FsIJosgvlMaXIvh8Eb+n7m3WsFbpL
	 0Wj0FF8aVHWvx1QkoLX2irp1M0B+HQTToAQ3MHjvXqV0wcfpigwECspiFfFH4moSr5
	 J/JfUQITrGDbw==
Message-ID: <sashiko-outbox-220806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/23] soundwire: amd: fix work drain ordering in
 remove path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261118104353.331556-13-Vijendar.Mukunda@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-13-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 11:11:05 +0000
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
- [Medium] soundwire: amd: unsynchronized in-flight IRQ in
  amd_sdw_manager_remove()
--

commit 71739fc162fa17f1b5b19380cfeb8b58889aa69f
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: fix work drain ordering in remove path

This commit updates amd_sdw_manager_remove() to disable SoundWire
interrupts before cancelling amd_sdw_irq_thread and amd_sdw_work.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 9715e2eb22498..44ef45ba943bc 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1265,8 +1265,9 @@ static void amd_sdw_manager_remove(struct platform_=
device *pdev)
>  	int ret;
> =20
>  	pm_runtime_disable(&pdev->dev);
> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	amd_disable_sdw_interrupts(amd_manager);
> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
> +	cancel_work_sync(&amd_manager->amd_sdw_work);
>  	sdw_bus_master_delete(&amd_manager->bus);
>  	ret =3D amd_disable_sdw_manager(amd_manager);
>  	if (ret)

[Severity: Medium]
Can an in-flight parent ACP IRQ handler still queue amd_sdw_irq_thread
after cancel_work_sync() returns, leading to a use-after-free of
amd_manager?

The commit message notes that an IRQ handler already in flight may still
queue amd_sdw_irq_thread and relies on cancel_work_sync() to drain it
without synchronize_irq().  However, cancel_work_sync() only cancels work
that is already pending or running when checked, and re-enables the work
item before returning.  It does not wait for an in-flight hard IRQ handler
that has not yet reached schedule_work(), nor does it prevent subsequent
queuing like disable_work_sync() would.

If amd_sdw_manager is unbound via sysfs while the parent ACP PCI IRQ
remains active:

CPU0                                  CPU1
device_release_driver_internal()
  amd_sdw_manager_remove()
                                      acp63_irq_handler()
                                        readl(... + ACP_EXTERNAL_INTR_STAT)
                                        amd_manager =3D dev_get_drvdata(...)
    amd_disable_sdw_interrupts()
    cancel_work_sync(...irq_thread)
    cancel_work_sync(...amd_sdw_work)
  device_unbind_cleanup()
    devres_release_all(dev)
                                        schedule_work(&amd_manager->
                                                      amd_sdw_irq_thread)
                                          <-- use-after-free

device_unbind_cleanup() calls devres_release_all() before clearing drvdata
with dev_set_drvdata(dev, NULL), freeing the devm-allocated struct
amd_sdw_manager while the work item is being queued or executed (even
with the interrupt_enabled check added in commit "soundwire: amd: use
interrupt_enabled flag to guard IRQ work scheduling").

Using disable_work_sync() on both work items in amd_sdw_manager_remove()
would prevent any in-flight IRQ handler from queuing work after the cancel
completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118104353.3315=
56-1-Vijendar.Mukunda@amd.com?part=3D12
