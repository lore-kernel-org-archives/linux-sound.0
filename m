Received: from mail2.fenf.edu.uy (mail2.fenf.edu.uy [164.73.124.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F069733D6F9
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=164.73.124.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650218; cv=none; b=dKk3bVCjnCUCBGJ+9fTQtfOC81ZH29Ys+TXarZPrGYymt1N69eq+L55J4AdgN5b5625Ex6EIKesWB6cIhWt3uFK8Oe5nSTPAzMMkopn64GyG1EMdVDZBr9hhW/Htm6VqsZRlw+kDRavpXqGRvnQjLH4wqoiTuGQ2K7AWBoReGB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650218; c=relaxed/simple;
	bh=784mSMNMxfO9cJ2f+RZwu2VjG0FaQ124GkK+XGn1Z1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eUYovYMDA5nxlTgVTlVFOC3aPVXlH7dOldwQEnWvd/IzxKkYb/Mv6aH3bnazhPEMKigMH0kAxwEqB1DJWQhw3+YjAHrP9dIrKBhwAQylJN+GEDCsnltOKDX0Aa5sR3sNlmokzhl7t7MyiL/6TF2NodgXte46UUaSnk20cDMiFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fenf.edu.uy; spf=pass smtp.mailfrom=fenf.edu.uy; dkim=pass (1024-bit key) header.d=fenf.edu.uy header.i=@fenf.edu.uy header.b=ptXouTW3; dkim=pass (1024-bit key) header.d=fenf.edu.uy header.i=@fenf.edu.uy header.b=O4A848M7; arc=none smtp.client-ip=164.73.124.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fenf.edu.uy
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fenf.edu.uy
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fenf.edu.uy header.i=@fenf.edu.uy header.b="ptXouTW3";
	dkim=pass (1024-bit key) header.d=fenf.edu.uy header.i=@fenf.edu.uy header.b="O4A848M7"
Received: from localhost (localhost [127.0.0.1])
	by mail2.fenf.edu.uy (Postfix) with ESMTP id 1447D676E3;
	Wed,  4 Mar 2026 15:44:51 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail2.fenf.edu.uy 1447D676E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fenf.edu.uy;
	s=20170630; t=1772649891;
	bh=wxHmMS0+kJvyDbvZ1XhgA7hlXhDAQ95qBfnwSykvVD4=;
	h=From:To:Cc:Subject:Date:From;
	b=ptXouTW3xMV+uNz7a7PtRAtIRnaVHFP4qddcKXJ7ogn5mzlNe+pwVRiX9rwet+Xyp
	 v3i7E/IU+X9Cwla3Re7HQVQsXxvZKFVpev4oQiBWzkDGBIyNq6jaDtBA8AuoE3NiMw
	 IHo4mfds+xFc6y0/wCnjVEyapvGv23GzkyHMual4=
X-Virus-Scanned: Debian amavisd-new at fenf.edu.uy
Received: from mail2.fenf.edu.uy ([127.0.0.1])
	by localhost (mail.fenf.edu.uy [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_G3e-pK7D3u; Wed,  4 Mar 2026 15:44:51 -0300 (-03)
X-Comment: SPF skipped for whitelisted relay - client-ip=192.168.10.4; helo=goku.localnet; envelope-from=greisch@fenf.edu.uy; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 mail2.fenf.edu.uy D1FED66F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fenf.edu.uy;
	s=20170630; t=1772649890;
	bh=wxHmMS0+kJvyDbvZ1XhgA7hlXhDAQ95qBfnwSykvVD4=;
	h=From:To:Cc:Subject:Date:From;
	b=O4A848M7jTtJ5rqEFrEPkH83AJe3J7rjm381ESlRDoH57T4nFN1P1zk/o+/y95/mS
	 h7opWjHzW32Af93Et/NHpNQ5eT5MYVGSOmHG24j6ogHUqw76mkqkm8sN6YRqc5SIYX
	 iM4Xrlz75bgcOa3J3yP3CWnE7fhwT+Og2oZJaDIg=
Received: from goku.localnet (goku.lan [192.168.10.4])
	by mail2.fenf.edu.uy (Postfix) with ESMTPA id D1FED66F87;
	Wed,  4 Mar 2026 15:44:50 -0300 (-03)
From: Guillermo Reisch <greisch@fenf.edu.uy>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for HP Laptop 15-fc0251la
Date: Wed, 04 Mar 2026 15:44:50 -0300
Message-ID: <2635256.2bixRq88gB@goku>
Organization: Facultad de =?UTF-8?B?RW5mZXJtZXLDrWE=?=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The HP Laptop 15-fc0251la (B9TP2LA) has an internal DMIC that
is not detected without a DMI quirk entry, as the last BIOS
(ver F.21) does not set the AcpDmicConnected ACPI _DSD property.

Adding the DMI entry enables the ACP6x DMIC machine driver to probe
successfully.

Signed-off-by: Guillermo Reisch <greisch@fenf.edu.uy>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 77a96854a45c..709887b3467a 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -647,6 +647,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = 
{
                        DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
                }
        },
+       {
+               .driver_data = &acp6x_card,
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+                       DMI_MATCH(DMI_BOARD_NAME, "8DC9"),
+               }
+       },
        {
                .driver_data = &acp6x_card,
                .matches = {
-- 
2.51.0



