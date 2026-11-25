Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608767;
	b=Zg4CRFoRl4fWW4NNwsrNExLXg+VR0xzK5zSAnOk97s8AlNrNsTBILrbFzXeIjgnbYdPN
	 sUZ2HjKDF+LRPL40HqmtJM6dGKTmU0megYJixR+th+6fj3coSEHPq2A0jas9PbU8wQeoo
	 t0u17ceG8NDahC6qPJB5E9sPCGZuslNW0Y9KnuW9OkyND44U1uMGW230fHCSpP9v+Bus+
	 YD0LFlfRaVHNWZ9xiowWM0M0ZmHGRtvVS3u315KdHG0S4qXeABRok8DatxsqPTqzqgMG3
	 Jn0h0M0rVBfJNwgJTvZ9sW8ky30Bmwd1gqq9EllrwUNfDfEaEE04MkUb461B2Z/MSlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bjI8AHQ7m4jgA91fm4jtF1Tcxlfx0iArocDzt6XuoC4=;
	b=yQ0+PmFXB9z1t5OTJu2lx3UPxDaoea505XOH5odb/msw46UnfbC4KjTU4sqn8lHArP9R
	 4NbwPxc5byYIESv0esbinMwnMnIpxOnKe6QdhITZGBHZi7gb5BZlg1C0t3eRE21h+EXer
	 0ZkCJk5whDqCDM+C8EdJrmuyt8a1rU/oFruJeiPJJUx2DqzKfOTJlSrrE2Vpoj5eTquUU
	 JaFJWdd5jytrTTgloB6M1D+V8vpntF7dnE1OdCi+dRXj26QJ67pULxMeIm+abs+tn/zc3
	 Ek+AsLOYBMcMOV3ASAoefoCwcsM//ROI8ZKrP3gJSt4TgPXrlIMYAhwuK1NlMW5HNrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CA8BQPpk;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B260606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B260606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CA8BQPpk
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386b8f2f671so2739403eec.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 04:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608766; x=1796213566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjI8AHQ7m4jgA91fm4jtF1Tcxlfx0iArocDzt6XuoC4=;
        b=CA8BQPpkFGYJETP5Jmxax83ihH2w9AshAsRfUGuV/3QgrKGAC5C5wnBt6nhmQ5xF5h
         UdBwgt2cLLvl9g1wmfKzAvy548AzBvAwiOroS+AF8SbeL4YNhkyV+jO8AWxACNx9HVZr
         stIYazRKRTAuG+p46Y5Zm3ln3Qh4KvJnXrMlOk9CXLsdFXnL37Ja4Zx9AgeiNTsyu8ay
         dGA963GfIVwmoVccY5nNlKHWIFN9gN9lvZsnwevkFii3gVs3EpmnysUDoyNbrGWWIdta
         9EPMFN/TGjUAsb9egIKWXC1y0QI0fzAN0nQgdJCsRxtBbRIPanIZy12lnHepe7W+Cesd
         qnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608766; x=1796213566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjI8AHQ7m4jgA91fm4jtF1Tcxlfx0iArocDzt6XuoC4=;
        b=JJ7+YPZeKdKiHERHZlBOjHaVnVbvuaz0kIQ51TekuCoaAHu8jn57J0coojSOUL439l
         qWnVmZ+cxNDDRgkdGiF6r1B5ZIKIgqWXkTPYiooJL6o5c/KlWCazffCqbZouPzoY5Fja
         FHAiRHP74Lj0fsFBquptaMkyv0ij1cIXwnHYMyN9ls9olhlaY30M1AE3foqgmEaSIvNq
         IjpcQl2mc81EeeVccupLmppyb58DFiY1Lhxs86bHcXpBfU1y+BSJey5Or+4NvmoREZkc
         8J158gA8ysNTJltuvoCCu6iV3AfTTfOkfBRearVjT25H3z/4xWqRa+4Tj4+6TfkhbUpq
         Ymow==
X-Forwarded-Encrypted: i=1; AL+hErEWFlhwHyiU5EDIG3XoeD3kMNnX88vj5ZNViQmKTHxWXQCpQ5/Q9GkLxtkBaDJTprb1D9urIUY8wssKUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vfdcpCmqOrtiUUnQRR9vWkk7NjGJPxYVGseZi86Yom57urBXn
	TShabjCgg4Q1l4kA3DD8E1WJ73taOVIGii5RQxkhxBAUgjKb3kvJX1rV1u39Pw==
X-Gm-Gg: AZFdTZdFLFPMTmLPgTFyrTo7LWe3pJI89smKjy8phQFhLcsBG9WJkiQeMHPFRmPwY/t
	jhC70J5zOtQnWJcLFqbyIeHVZYWrMEx0iUSvejsAvmh0GzyAVFTwGuh6DQr4kqRmM9621BE0nG4
	konfda1+mtJwguLa4vjk9/YqXn7+My7v+UFGfvtAultOiSVaibBPIClkBjHxaHuWOECpZnPayEQ
	Unm6LvPPxdBEtvIcypQCEJbE+PyAgwTQiEy+g3IrbhhXauvPVCEDHaECXoYUD4uFri6DbCTeNGk
	EjV9GlUvOZmTVOn+nceM4dXklHeFE8rdtqmc35kMwt6NrNE1lTTfmUCDTrF3rt804p5E9Y0/2Z6
	UZ9SnZrdUzKplIo15LT++vPSrJcAgmF82GQ7Nx8w4mconfyxNz/k2tDO+x2vIJj2FIJh8OKImBI
	85AAd4EjrHhaWgF6MvNKa7J5/zGrFj2foWY8b8H88FgPAqGrg9aqfCxA9mUpG13tMclEp5ZeLYB
	YEwt5Eu1ajSfNpTGH/9VO6/fxpiIZp+lRdWG0j+XvZfV+T5v9D+/jLXpHlDC3CeydMowNtyDDJT
	FUs7cnnifmfOSaEC7359eNrnm8wbSSqLzh6L0n8hv4mU0PBrOHzwCFc=
X-Received: by 2002:a05:693c:6390:10b0:386:ac97:f670 with SMTP id 5a478bee46e88-386ac97f867mr9397200eec.12.1795608766468;
        Wed, 25 Nov 2026 04:12:46 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm12234336eec.17.2026.11.25.04.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:12:46 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ALSA: bebob: bound the channel position walk to the response length
Date: Wed, 25 Nov 2026 20:12:36 +0800
Message-Id: <20261125121238.1602172-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
References: <20261125121238.1602172-1-maoyixie.tju@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_data_channels() walks the channel position response by the section
and channel counts in that response. Nothing checks the counts against
the length of the response. A section of 128 channels can read past the
256-byte buffer.

Take the length of the data from avc_bridgeco_get_plug_ch_pos(). Return
-EIO for a section that does not fit.

Found with a CodeQL-based static analysis tool. Reproduced in a
userspace harness under AddressSanitizer. Not tested on hardware.

Fixes: eb7b3a056cd8 ("ALSA: bebob: Add commands and connections/streams management")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 sound/firewire/bebob/bebob.h         |  2 +-
 sound/firewire/bebob/bebob_command.c |  5 +++--
 sound/firewire/bebob/bebob_stream.c  | 11 +++++++++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 41e019b9e24e..7891a5802f1a 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -194,7 +194,7 @@ avc_bridgeco_fill_msu_addr(u8 buf[AVC_BRIDGECO_ADDR_BYTES],
 }
 int avc_bridgeco_get_plug_ch_pos(struct fw_unit *unit,
 				 u8 addr[AVC_BRIDGECO_ADDR_BYTES],
-				 u8 *buf, unsigned int len);
+				 u8 *buf, unsigned int *len);
 int avc_bridgeco_get_plug_type(struct fw_unit *unit,
 			       u8 addr[AVC_BRIDGECO_ADDR_BYTES],
 			       enum avc_bridgeco_plug_type *type);
diff --git a/sound/firewire/bebob/bebob_command.c b/sound/firewire/bebob/bebob_command.c
index 022df09c68ff..2e5a43e24615 100644
--- a/sound/firewire/bebob/bebob_command.c
+++ b/sound/firewire/bebob/bebob_command.c
@@ -181,14 +181,14 @@ end:
 
 int avc_bridgeco_get_plug_ch_pos(struct fw_unit *unit,
 				 u8 addr[AVC_BRIDGECO_ADDR_BYTES],
-				 u8 *buf, unsigned int len)
+				 u8 *buf, unsigned int *len)
 {
 	int err;
 
 	/* Info type is 'channel position'. */
 	avc_bridgeco_fill_plug_info_extension_command(buf, addr, 0x03);
 
-	err = fcp_avc_transaction(unit, buf, 12, buf, 256,
+	err = fcp_avc_transaction(unit, buf, 12, buf, *len,
 				  BIT(1) | BIT(2) | BIT(3) | BIT(4) |
 				  BIT(5) | BIT(6) | BIT(7) | BIT(9));
 	if (err < 0)
@@ -206,6 +206,7 @@ int avc_bridgeco_get_plug_ch_pos(struct fw_unit *unit,
 
 	/* Pick up specific data. */
 	memmove(buf, buf + 10, err - 10);
+	*len = err - 10;
 	err = 0;
 end:
 	return err;
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 449cb17717f0..5850357cb3da 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -255,7 +255,7 @@ static int map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 {
 	unsigned int sec, sections, ch, channels;
 	unsigned int pcm, midi, location;
-	unsigned int stm_pos, sec_loc, pos;
+	unsigned int stm_pos, sec_loc, pos, len;
 	u8 *buf, addr[AVC_BRIDGECO_ADDR_BYTES], type;
 	enum avc_bridgeco_plug_dir dir;
 	int err;
@@ -274,7 +274,8 @@ static int map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 		dir = AVC_BRIDGECO_PLUG_DIR_IN;
 
 	avc_bridgeco_fill_unit_addr(addr, dir, AVC_BRIDGECO_PLUG_UNIT_ISOC, 0);
-	err = avc_bridgeco_get_plug_ch_pos(bebob->unit, addr, buf, 256);
+	len = 256;
+	err = avc_bridgeco_get_plug_ch_pos(bebob->unit, addr, buf, &len);
 	if (err < 0) {
 		dev_err(&bebob->unit->device,
 			"fail to get channel position for isoc %s plug 0: %d\n",
@@ -311,6 +312,12 @@ static int map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 			goto end;
 		}
 
+		/* this section should be within the response */
+		if (pos >= len || pos + 1 + buf[pos] * 2 > len) {
+			err = -EIO;
+			goto end;
+		}
+
 		/* the number of channels in this section */
 		channels = buf[pos++];
 
-- 
2.34.1

