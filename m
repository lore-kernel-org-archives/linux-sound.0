Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C654734D4
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963459; cv=none; b=eHtSPbDZL0xsegFBR/qU+4+oLjoiiFL9QtQS3xBEQ26WH/oFvek6tKb61mBbaNhQwluKJxJoWvEH2mRMsbQcCzLZb0PITC8ZlnR9tfaSIrUOoaTFggElGzcI6jZIL/+p31waS6tJ8OJnqDV9xSrA2A5in9nzozRYLDAD6pugz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963459; c=relaxed/simple;
	bh=Sol0fsEGPpgqNxykLoG5j8dK9XltvHpcbcW+27SgjCo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=Hs39lld2Y5kLxmI6hWp8vM99cpOyL/zSClNeIR5gZsgK0Pyw9a0ied7Rohkolq2uRrBB+F6wTqhHb1UDW+5alieGvMzzNiFHin3xAd9lUaH6FPoDeiuTpAjfZAAA75frdx7h/WvtQAVfqViSexv+WWT7rLIihrC8fL1infu3syY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thefabio.com; spf=pass smtp.mailfrom=thefabio.com; dkim=pass (2048-bit key) header.d=thefabio.com header.i=@thefabio.com header.b=0rGy1DSs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nCeqC7kO; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thefabio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thefabio.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thefabio.com header.i=@thefabio.com header.b="0rGy1DSs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nCeqC7kO"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 62A3A1D00114
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:37:36 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-06.internal (MEProxy); Wed, 14 Oct 2026 03:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefabio.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1791963455; x=1792049855; bh=I1
	e24eGTo57nR3k4EInVG9n6q0QXNth6gctu4WhcoCE=; b=0rGy1DSsvkh2rOCqbn
	Cx7pSYXAv6lXuP2kVxLi9j3Jmw9NoP80jKtWA88w24KBLEjIhSe91jy/9MSyAUfo
	t6Nfnai3Jun3JcR55i/yYC1hgUUAiXVIyarnAyJEUYwi6TSg+JbB9MxUvVwhEN2J
	SSXn7IdH30bKtUzlqfpYBnFfkLBOiEKN7kNZyDWOhG7TGd0rp+wwB1q4QQilrq5y
	337LDxoknZwjnQzQaeQFd8DQHlUsumFScspWkfrr9QZr+pQRFdbjs5yVQVtrzVNu
	mFEfhAofBwDev+UHMd6PfJPbhYrrQ/AeoeWbYMPqqg5DUBpP3abgvbZLe3qlE/3O
	q3pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791963455; x=1792049855; bh=I1e24eGTo57nR3k4EInVG9n6q0QX
	Nth6gctu4WhcoCE=; b=nCeqC7kOQaDKCGQYd3uXVOP2kmWlQ21xn2x/T0UCoUep
	KfSV41owa2iBsTVQ/d3ZCHDQ5oIlcRZ/IPfu5eZSuEbP9R1/Kn7RwaYilClIzqiv
	lkHZyPvr7kzB2mgV1evJud7tlNvxPJ2DnvePT6DJjqILGHpbDdo2n8s5MKfiwkMU
	nN8WR4Gpnh0uJtTCdJnjjlCyvO7GVjqlXVWV5g4Mp3Qm7Cf12UiEjpuL/OjY+7t+
	xi8+PcLbvw/MMI6HGb8fiiW6qanjtII88vtkhTHwpHTwgIVf7lsufhnIkUyU4j73
	nktAtjuv08VdgBcNb5bZMdeSUJLze0c+1WbweKdGcQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=thefabio.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791963455; d=thefabio.com;
	mf=PGNvbnRhY3RAdGhlZmFiaW8uY29tPg==;
	rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:7KL3bc9qfG3jSlQIjG9LwRVqLoGczYCmn0KAjmaoGuHeTxO
	nC7tlKSpGgKfeOv+kmwXBu/Wok1yOBITdeBwiCq98+ojMZU1KB6DyMgL3QjxDdC8
	WD854Rpj+LvD7/Z/4x26pZPyhBPX2QZ2lCMvSIu0CtzfcpcIhLgSfbOPTBxr/CrA
	r8/fCS8HpC+siBCewqaWyWLUI62+/BNnPsDOtuBeU/pPt0za44OxyoL9pNo/Ur3I
	/ohAcE6JsGQzJEFqHUUdteeF8w0Rc9YA0dECz7zO8EhuY8ojzf/+aaMddgAEMbPZ
	NGuyAh84P1+5bVZJCRA1l40S2l2sVvhOWOSQ/UQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:5d98bfnJZ7erVpd4qFsik4e8Zwb4kn9lSMK5JaxXBoU=:Sol0fsEGPpgqNxykLoG5j8dK9XltvHpcbcW+27SgjCo=;
X-ME-Sender: <xms:PzHPaloJCzwGAbQSnb9c6IPdMQZArgKo524NMV5aJKMuPOFruXr_Lg>
    <xme:PzHPaieroAEONs1HavVVbAsCnQi4dSr06bPY7aLLMiG2wqu_1jUVwMyDXdGi-ClWB
    m4Qz4szUIoldUaIqRiOtJjSjw62vG4FuzraMxa2JMr-FuboQHT7GkE>
X-ME-Proxy-Cause: dmFkZTGv0gotNG+rOzyqb8qybOS6539zeZCt0cVMpykhLDH26/Kikcv/5xWtL6LBVjzF2T
    TIoy/vXXgPfZOin6hXEAiQUnyT/b3dcWpMjTcQ3r34ikmy9V9dNDrWNwkijrdWzUGFLcoG
    MdzkaNvVMXHTa0rP6mlF3uwHLqJeSp8CKVAI8wrJ8J8lg5Tb8krtNnK65z2DxHSdgNDKT+
    /V/XdRCi5arQuZ/8yhFJT8/GVZe/PTsKcj1xC1FQ7llfHCAWmsDNcYRGIReB24JJzhdY3q
    3j0qeuup5KFlTGl9TYCJct+K1WTlaubG0m8dAj85g6yRHzZaMfwBFEO2+rKxHtSun71bdA
    xfRk8hfTwwTV4zzlZjrthRHcVyRxTQ01Q9tSM+2ydF3x9KC+oyh72YhyAkyY2j2sVVWc66
    lQDfRdnE2fLId7B9HQsDVl3Ya4sgPMBxsgNzXHpWTFCusVXyzD02etvn/0670vvwaWu6e+
    VyLmz86OGGj8+XlBw4T24ldG6jmrFvQl1Xmx8SE4sz74dllEVb27Yjl0QF3jMnRJ56wIUx
    Z57SBOZW67JLrz9YcW9eCyMLUh5E1gE62ZzjjD3ueoOz7T1mqebQVq8hkjrh2/Q56ujfpz
    ghTorVeIdR4aEKYBGG749IXQLyNNVb+M7IB/G8OvlKKjRh0lA1fcOzCy/50A
X-ME-Proxy: <xmx:PzHPasNfnAMpYgGOwfEFYkeQQKM7kqFc5DSMh462-ZD65zNL9w6n3A>
    <xmx:PzHPalP8L2glv6v6i6xUqtZtd6JqSq-MnYrRSv6Mtq6PIvPId71oQQ>
    <xmx:PzHPaljd6PrT5K7rCQdv8CwyhT-HMce2ACA2hGym_Z8IPLWaJl8j4g>
    <xmx:PzHPaqu80vcN1ut3IQBl0-7ImqdKAec7I5dxtQBS-awrY8lAJ60j0Q>
    <xmx:PzHPakAppaq8WBBFENgZvQacIbk0q5yAzVteRm_01ak0_rN1Rqz4gC3w>
Feedback-ID: i95764ab5:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DB7951EA006B; Wed, 14 Oct 2026 03:37:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 18:37:14 +1100
From: "Fabio Lima" <contact@thefabio.com>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>,
 "Bard Liao" <yung-chuan.liao@linux.intel.com>,
 "Takashi Iwai" <tiwai@suse.de>, "Mark Brown" <broonie@kernel.org>
Message-Id: <82a57f28-2cbb-4ef1-a1e6-7023ec2f34eb@app.fastmail.com>
Subject: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves during endpoint
 creation to prevent collision on Lenovo 83SN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

On the Lenovo Yoga Pro 7 15IPH11 (DMI: "LENOVO 83SN", Board: "LNVNB161216", Intel Panther Lake platform), the internal SoundWire audio stack fails to initialize due to a duplicate sysfs entry collision during machine driver probing.

We have investigated the root cause and verified a working patch locally. We would appreciate feedback on whether this should be handled generically in soundwire helper utilities or via a DMI quirk in sof_sdw.

---
Hardware & Topology Context:
- Platform: Intel Panther Lake HD Audio / SoundWire (`snd_sof_pci_intel_ptl`, PCI ID `8086:e328`)
- Physical Codecs on SoundWire Link 3:
  * Realtek rt721 (Headphone Jack / Headset Mic, `0x0721`, status: Attached)
  * Realtek rt1320 (Internal Speaker Amplifiers, `0x1320`, status: Attached)
- Firmware / ACPI Artifact:
  * The OEM BIOS SSDT table (SSDT34) defines a third SoundWire device, Realtek rt722 (`0x0722`, `SWD0`), on Link 3.
  * This device is physically absent on this SKU and remains permanently in `SDW_SLAVE_UNATTACHED` status on the SoundWire bus.

---
Problem Description:
When `sof_sdw` probes, `snd-soc-sdw-utils` discovers devices on the SoundWire bus via ACPI and attempts to register playback endpoints for both `rt721` and the phantom `rt722` on Link 3.

Because both codecs request an identical endpoint name (`SDW3-Playback-SimpleJack`), sysfs creation fails with `-EEXIST`, causing the entire SoundWire sound card probe to abort with error -12:

[    8.231456] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/sof_sdw/SDW3-Playback-SimpleJack'
[    8.231462] CPU: 4 UID: 0 PID: 377 Comm: systemd-udevd Not tainted 7.0.0-38-generic #38-Ubuntu
[    8.231468] Hardware name: LENOVO 83SN/LNVNB161216, BIOS CB-01 10/20/2024
[    8.231471] Call Trace:
[    8.231473]  <TASK>
[    8.231475]  kobject_add_internal+0x12b/0x2f0
[    8.231481]  kobject_init_and_add+0x62/0x90
[    8.231485]  sysfs_create_link+0x24/0x40
...
[    8.231520] sof_sdw sof_sdw: probe with driver sof_sdw failed with error -12

As a result, no internal sound card is registered, and only NVIDIA HDMI output is available.

---
Proposed Solution:
In `sound/soc/sdw_utils/` (or the SDCA endpoint evaluation logic), check that `slave->status == SDW_SLAVE_ATTACHED` prior to instantiating endpoints and sysfs links.

When unattached slave devices are skipped:
1. Phantom `rt722` is safely ignored.
2. `rt721` (jack/mic) and `rt1320` (speakers) register cleanly.
3. PipeWire / ALSA successfully binds internal playback and capture streams.

Draft Diff:
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 1234567..89abcdef 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -xx,6 +xx,9 @@ int is_sdca_endpoint_present(struct sdw_slave *slave, ...)
 {
+	if (slave->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
 	/* endpoint matching logic */
 	...
 }
--

---
Questions for Maintainers:
1. Is checking `slave->status == SDW_SLAVE_ATTACHED` acceptable as generic behavior in `snd-soc-sdw-utils`, or is there a case where unattached devices must have endpoints pre-allocated?
2. If maintainers prefer limiting this behavior to specific hardware quirks, would a DMI match in `sound/soc/intel/boards/sof_sdw.c` for `LENOVO 83SN` be preferred?

Signed-off-by: Fabio Lima <contact@thefabio.com>
