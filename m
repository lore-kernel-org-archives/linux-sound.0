Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067365;
	b=zfnsGZgVnIvqL53hLXuYG8Et6Zqnf8nnl9ETCRYqnfIfe6PK8WRZD/vov56FOkeWo4ir
	 3SGMNm2O/Qk1MEEriNsf7d7bDIf7Hk3rAxN6afve5Vb+FrArODi5iBIGQTdKrc52Sjfc3
	 vCj2OpMbxyLL23IsFa4dorzYcavDZIC0difHpl7oVJQgQyhGXPQ3orWhQPvhzhY47JM46
	 VLPBBHyjQVX+0X9Y9/kAUfK0LLJ7BKx/nDVtMbVZDktNwyj6dGJflLwESdFrzc1X40jKM
	 gl9UShMF45EKhhS3FEmACkZQ3cNvd8MpPAKGqBYH7N2OTJuigytonwxoAVH+qKVb5ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067365;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fLIy1Joh5jfhH5kMTR1pLL9RuXYkR8aoafR8Ku/m2nE=;
	b=dyrE04h4/6Flj2/MEhLvYKZyf0gqi0TmmTVtmQmpDTLTeRGDn1BZsJTgPZ3WP7Nxzsfn
	 5nzER3lWnkBf4Pk2wlNdBJTEd6UDlkKUzDD2lOxYgel4IJjUhPTwfiXhkrTx/jr5xVIAj
	 Ux+SaDo18rLA89Nh8FepVeOYIMlFQ7KK4j5Cbn12QlNhi6nYWGar3lIU87NIP5D4yHq+Q
	 HWMKkhF2oxDJU++6Ur2PLAHeWqL8Os5wmpf9GFQ3R4X1XGpO3sfJiQQvuB6g6IkkmlnQ2
	 dq6tcH/SsavjF0VI5dWN9LaX/KcHPZPytfsXSoSf5As4r0oq1tb3p2qRSAUzwXHdMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqFjbdbC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B132606A32F
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqFjbdbC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D3A1F00A09;
	Sat,  7 Nov 2026 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067365;
	bh=fLIy1Joh5jfhH5kMTR1pLL9RuXYkR8aoafR8Ku/m2nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PqFjbdbCffPhKx5i05Rpj1vzzVQdrkdt8gVmwKbRTnlN2NVgvl8evVE2W/38ZtvpW
	 S1V+6cAz8WgyZUuG/TGB3jcqtDkZmBTixi1kpCFUEBg6u6gJ46EK2yR/XGKQZVDM/Q
	 jSZW2PnokTIr0xIXmFAUFQcQmLN3tQOq509y1wX22p7ucWBl1p1aDcF1x5c2MQ+kZx
	 6bW18Oe8rh7MUTBlovvx/lbDW4ZL/ybaWMwW6HCYTWQg5hRTqWACl6+qafrW+WOaza
	 5UZkJ/rsvEUPI2dkZ7loRWcVHGbatRBSs4/FLXq6HPvqavqNqIidXsmlr+2/XKqnHE
	 PhyZ7MF+fgDXw==
Message-ID: <sashiko-outbox-203009@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/25] soundwire: amd: fix missing wake interrupt for
 ACP6.3 in POWER_OFF suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-9-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-9-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:02:44 +0000
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
- [Low] soundwire: amd: inaccurate Fixes: trailer in commit message
--

commit e0001eef73595d8c30441824baf09c46bbaf4fea
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

> soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
>
> On some OEM platforms based on ACP 6.3, with a SoundWire topology
> where the UAJ peripheral is on one instance and the speaker peripheral
> is on the other, wake events from the UAJ instance are silently lost
> every time it enters POWER_OFF runtime suspend (D3) while speaker
> playback keeps ACP in D0.
>
> On ACP6.3, unlike ACP7.0/7.1/7.2, there is no dedicated host wake
> interrupt path (no ACP_EXTERNAL_INTR_CNTL1 host wake mask bits and no
> PME wake mechanism). The wake event from a suspended SoundWire instance
> is delivered solely through the standard SoundWire interrupt bit in
> ACP_EXTERNAL_INTR_CNTL.
>
> In the POWER_OFF_MODE runtime suspend path, amd_deinit_sdw_manager()
> calls amd_disable_sdw_interrupts() which clears the SoundWire instance
> bit in ACP_EXTERNAL_INTR_CNTL. After this, the wake interrupt has no
> delivery path to the CPU.
>
> Fix this by re-enabling the SoundWire instance bit in
> ACP_EXTERNAL_INTR_CNTL after amd_deinit_sdw_manager() and
> amd_sdw_wake_enable() complete, when acp_rev is ACP63_PCI_REV_ID and
> wake_en_mask is set. The acp_sdw_lock mutex is held around the
> read-modify-write to prevent a race when both instances suspend or
> resume concurrently.
>
> Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after=
 link is down")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

[Severity: Low]
Does the Fixes: tag point to the right commit?  86a4371b7697 ("soundwire:
amd: fix for handling slave alerts after link is down") only added
cancel_work_sync() in amd_suspend() and did not touch
amd_suspend_runtime() or wake interrupt handling.

The AMD_SDW_POWER_OFF_MODE runtime suspend path calling
amd_deinit_sdw_manager() was introduced in 81ff58ff71ad ("soundwire: amd:
add runtime pm ops for AMD SoundWire manager driver"), and wake enablement
for that path was added in dcc48a73eae7 ("soundwire: amd: change the
soundwire wake enable/disable sequence").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D8
