Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8E935F16F
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397755; cv=none; b=QRUu6CWEcfZ6GoDVHO2yC8JUYpx/4HvryPjEHzQ+31CRnERsYb1wqH08p/ypGssbwN0MO7srzbiY2JAouWmMPHeEqzVo4meA+sDmLJa5XLVlbVqBFAYP3mungmxEdtvevE+fNzDBQPsM3iuFr3074aKhH/me4nbNSAlsH9aj6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397755; c=relaxed/simple;
	bh=41ooEKY6tbkXTp2Wy7gDp2dY0InaAM/0GP0q8EbepOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eBa4hmB67KJtELXN75ojxIs3bfG6VMhoSuk8lT+0X35DaqPwHzy9ZdVbBginfeWsKyLf+XcB3SZ8ugDOBeFAKLzsILCxg86SWZz1Prg+Gelu8lLSTuLsrryjlnhHIaQbAXYXzUX40WAmrEyzRBxiy6eMtsoRU6u00QVShRPCG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfL7F7GW; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfL7F7GW"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304cf518c9dso7583625eec.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780397753; x=1781002553; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VP9k65AbBxriv6ma5NXnzfyyuJqIbzDsRm68/HXAt1Q=;
        b=NfL7F7GW0DK+s87d5T4scYV2O0OCkG2FziffnlRzz5QCwgi7A1T/zCWIZw+jjorizs
         XfFcKtQPtisbL5nz0erEyF71jLawxK0Rhkmln2mYdBy9mqDnKQAtSIzmz1vY13toF2ry
         pTdGSfNJHWOa6S+xKZgVeZ1orGwHu9p/5ZxiQUKqGzmC+3EPp87V+ZHDremvMyF8c+CZ
         IefkZbwA3b6fNp8KWqUPEVsZfz7BnR80LJFOPT7CaloCzEdqz4e1FttkGKJi3CTERSux
         7wdh/iM0r+4XE5K8crGwY8SSnUhsKqifrRFi8Xjh7H0b+FBocv8+b8NdCiglsGG5w5Al
         m9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397753; x=1781002553;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP9k65AbBxriv6ma5NXnzfyyuJqIbzDsRm68/HXAt1Q=;
        b=sERIQw0kS/8Sv1SnH/h88TKVWnLKZ4jRTzL2Mfiy2boEwZVzC7t7idnl2RLM3sFlU/
         dyXRAkqyOUkLyvsEd027NOqV6i6aDVLPwoI4s0bHGziK9WFbujgF1E/RwJ+N6bjA3RAv
         6yP9WDralOtwnOD38zj9YrmDzIjRv9XpPfK29RwHOrxWJ45kAOGf67XpvQadPpPwRMpe
         wCAfzueb12nW1M7iz2/6aI1Uhgy+3pXuIa+1Bz87u9C3mXO6ZbBT6nW4H9XHQR0yyFBq
         FnZ5U/l6+lecZHOtgajmdWCPR864aEh0lwh2akzeXURpDJ97ZOavYBfl3HWCjhd0ZRes
         2qzg==
X-Gm-Message-State: AOJu0Yy5zbDVABRdYKm0jac4iDoUgZF3a+YrBQtpI8StADp84FMjzBZR
	IQBqWW35F8uYCeJDnWKQJgpgffC7+ZYJM7+UEGH5bI/aTvCS4l4dqTP3
X-Gm-Gg: Acq92OEs7SXDgaGWZm+8OqXIYbAvSXBNBjNXE6OOKj+SEVbD2tnZw5p8Q0DlcvxnPim
	daMOWLsnBB5Z0/STidy1i+oRlIP0KzPhOq9AI3M1c/QLSdYZDHbw3yfQhwYOMVTlXkx1HB4YmnG
	wUIWWwdP761L87a4XI+mifzE4GwMllqKG2onOP99U4V2zYSquHUc0BVV0oYgnu9XxD8PA2vgApI
	Mbl5mPmSuYq5nwYeJwZSeN/9IA3hfih0+OHMJLL3jTPaSYbifQPTXHw1806wpCwBY4SAWOveaSK
	pp+qDQBqOd9IbfX4cFYzwsw8wdhoPpn2wuI9jsFZxQJi18wbVJVkDnFFom68D1xv7JV7Chy2x7F
	DjBRq4tY5n3YE+r2+KCdhS911WGQJyxUWGrhVbAxUiUjMkPZca4TCXbsCNcSuVSqGGOvBDLSf2a
	BsEyW8pPTms9+unRRzANSPni/mkyZJaTxP9KLsEpxQUaJNmv8yiQ4XtgmHgVRhQ5XFgL+RlcvXs
	B/IWpu/Nz78
X-Received: by 2002:a05:7300:3215:b0:304:ed85:5f43 with SMTP id 5a478bee46e88-304fa61bc01mr6139303eec.24.1780397753104;
        Tue, 02 Jun 2026 03:55:53 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2eb24fsm11008395eec.7.2026.06.02.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:55:52 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 02 Jun 2026 07:55:46 -0300
Subject: [PATCH] ALSA: seq: Restore created port information after
 insertion
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-alsa-seq-create-port-info-fix-v1-1-eec0280131e9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQ1BqLVxEXafpXRySpmSiF0
 rsbdfm9xVtJkQVKp2aljLeopFhhdw2Fm49XsIzV1JrWGWcs+4d6Vjw5ZPgCnlMuLHFKPMnCve0
 OR4z70LuO6mPOqPn3P1/+1tdwRyjfKW3bB+Q7pt+BAAAA
X-Change-ID: 20260601-alsa-seq-create-port-info-fix-81457ed3c864
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2462;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=41ooEKY6tbkXTp2Wy7gDp2dY0InaAM/0GP0q8EbepOo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFly27Y1KxskTTyofUY8dk1dq9VajTzVpxU7N4s0Py8xN
 Os/bCLVUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABPZfZSRYceGsxN33sgUmaJR
 5b+HZ2qEsqxkzPz53sLJVY/OqwlrX2Nk+PugZSvD8qJtc2o3nos9EiHx52Vkf5Zbe+a77RLzbec
 t4AUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Commit 2ee646353cd5 ("ALSA: seq: Register kernel port with full
information") split sequencer port creation from list insertion so a
port can be filled before it becomes visible.

However, snd_seq_ioctl_create_port() still copies port->addr back to the
ioctl argument before snd_seq_insert_port() assigns the final port
number. A successful SNDRV_SEQ_IOCTL_CREATE_PORT without
SNDRV_SEQ_PORT_FLG_GIVEN_PORT can therefore report port -1 to userspace.

Move the ioctl address copy after successful insertion, and keep the
default "port-%d" name assignment from overwriting a caller-provided port
name. This restores the observable behavior from before the split while
keeping the port populated before publication.

Fixes: 2ee646353cd5 ("ALSA: seq: Register kernel port with full information")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/seq/seq_clientmgr.c | 3 +--
 sound/core/seq/seq_ports.c     | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 19d6fea012f6..81ef461a9118 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1306,14 +1306,13 @@ static int snd_seq_ioctl_create_port(struct snd_seq_client *client, void *arg)
 		}
 	}
 
-	info->addr = port->addr;
-
 	snd_seq_set_port_info(port, info);
 	err = snd_seq_insert_port(client, port_idx, port);
 	if (err < 0) {
 		kfree(port);
 		return err;
 	}
+	info->addr = port->addr;
 	if (info->capability & SNDRV_SEQ_PORT_CAP_UMP_ENDPOINT)
 		client->ump_endpoint_port = port->addr.port;
 	snd_seq_system_client_ev_port_start(port->addr.client, port->addr.port);
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 17daacd4476a..6612e92d801f 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -170,7 +170,8 @@ int snd_seq_insert_port(struct snd_seq_client *client, int port,
 	list_add_tail(&new_port->list, insert_before);
 	client->num_ports++;
 	new_port->addr.port = num;	/* store the port number in the port */
-	sprintf(new_port->name, "port-%d", num);
+	if (!new_port->name[0])
+		sprintf(new_port->name, "port-%d", num);
 
 	return num;
 }

---
base-commit: 96d4780e9ff5168195e891c474a85bb0d510fe9f
change-id: 20260601-alsa-seq-create-port-info-fix-81457ed3c864

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

