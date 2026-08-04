Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A783D8104
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884379; cv=none; b=RqgS1pbq+qztJwFUwuDBWykapQNAX4EQK/whhuNd9pamlSxEb+JMjHgqxGmif89zBeLbekpRXwtcNes1uTQcIYu9G6qnNso1nSEtH4uZcsf01jS5PSvqhItbgtc+EutIw/JEnWfwWdCxyHcmLQYarvaOBOhpsbJ3je2vQwFIPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884379; c=relaxed/simple;
	bh=H4e7Ps1XtiKH4TO/3BjbXXc8kP7dZkzLPOEI7twRvAk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plDBycNJL0YXswUC0p9S+WOC9w6zxCL6BVZughcD43fiwr3ziXmLxLinJS+s8v9Lcuu8gKGUo6HJLnmgX2orSpMUkMjPj9u/Ra3yfTU7J94tOkysAvKG/DvBbWCI+eu5PKQCqnEyuI3mZ1ZHyL0Mrxz/fpQu0g8SDK1c/DQQiWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FS1RuTdQ; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FS1RuTdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785884370; x=1786143570;
	bh=rAjpVHNOuKzbCe4ywlmfVDM0tSDIwLDF//f7jRQKZz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FS1RuTdQMds8FLF7ZMDs+hT/qJ/nge5jcHTivoOjphsdcNJCYXAaGEyKjPwUSi+Gw
	 X69JeruZD5jXUyEg1p4x6GJGZa8NdPuK4oitWcUc+vod4phXpxdYrFI02GHl1Zmnr6
	 jzjyC6V5u0fQz8Nv0tlOwz7yLyuTNmYf6rR+CY/NsWM+pgWpKLnhStRg77tfQWbpvY
	 Vfsoy+aRO4e98vy7rfZ6E+UufYRn09BWigKtRibNuaJkMOVDa4BIY+VL8uNedTqPys
	 X+rwEmAJQP0guy9NsRsORBD5mToe+FjfKfsNyfNbCkGJgZS8YIQP1SoDIJzdDYJvMo
	 dRxt968OJpcsw==
Date: Tue, 04 Aug 2026 22:59:24 +0000
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: rt1320: run the initialisation preset on the first hardware init
Message-ID: <20260804225853.31585-2-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b39d5585c53af84ae802257a66e0d5e0bc0ab80b
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

rt1320_io_init() applies the vendor initialisation preset only when the
amplifier's SDCA function status has FUNCTION_NEEDS_INITIALIZATION set:

=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {

Its two sibling drivers guard the same write differently, also running
the preset on the first hardware init:

  rt712-sdca.c:  if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
                     (!rt712->first_hw_init)) {
  rt722-sdca.c:  if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) ||
                     (!rt722->first_hw_init)) {

On the Microsoft Surface Pro 11 (Intel) the RT1320 never sets that bit.
Its function status reads back 0x41 on every boot, cold or warm:

  rt1320-sdca sdw:0:0:025d:1320:01: rt1320_io_init amp func_status=3D0x41

which is NEWLY_ATTACHED | FUNCTION_HAS_BEEN_RESET: the function reports
that it has been reset and does not consider itself in need of
initialisation. Bit 5 is never set, so the preset never runs,
rt1320_vc_preset() and the MCU patch load are skipped, and the amplifier
is left unprogrammed. rt712 and rt722 would have run it via their
first_hw_init fallback.

Add the same fallback. With it rt1320_vc_preset() executes and the
amplifier reports RT1320_KR0_INT_READY=3D0x1f where previously it did not.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 13493b85f..d1f3b160a 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1900,7 +1900,7 @@ static int rt1320_io_init(struct device *dev, struct =
sdw_slave *slave)
 =09dev_dbg(dev, "%s amp func_status=3D0x%x\n", __func__, amp_func_status);
=20
 =09/* initialization write */
-=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION)) {
+=09if ((amp_func_status & FUNCTION_NEEDS_INITIALIZATION) || !rt1320->first=
_hw_init) {
 =09=09switch (rt1320->dev_id) {
 =09=09case RT1320_DEV_ID:
 =09=09=09if (rt1320->version_id < RT1320_VC)
--=20
2.50.1 (Apple Git-155)


