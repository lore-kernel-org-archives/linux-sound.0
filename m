Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60D51D07BD
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727892028; cv=none; b=fbsAa86+/pxeBwkfs/VGfKGiOKKXp2ju2ACvZ23DfsfdFaZdoOi5Bz77haeiSj5GU9lX3jx+KrSkHxIuIxLUbFmNVN0jUxOC4HUcI3jIjPJnzEJMy5DzvMUGP2x3beiQdZkJZBBSLipCHM9cvRFrUZVS1GazWC+ONZDales4VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727892028; c=relaxed/simple;
	bh=0bP5ABI3IfQ9bS8P0aodyw78PLEfTyopKF4C4Y/RNR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C9LmlAdbpOavI3eg8ue3J42ELUPT7dhgJDbc86K6KBDMzROYR1j38eQXU7q0MDseLFA+Y9TDkF4MXGiJSB4Utj6PggIy+vCzwO1UM6cPxvQ1fIzSf0qFIxTrxjpD7kJ7FBBP6Qv8Uh3ICe4XtqCrd82g2X3IdJ+hdRCv+QqPm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=D9/gZLbF; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="D9/gZLbF"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7781B4484;
	Wed,  2 Oct 2024 20:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7781B4484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1727892019; bh=emLskzn3O64qm0t5JkSTEAloeNw5CYMqZreuCF5mt6o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=D9/gZLbFT3gXq7IgV9AEmpgpWZ8VBM1bIvbpjOCmMQMMJKc/G5QPD808YnYYqicgI
	 ebVCrOUpcFlWDfztWXp9ODniqIi16z5R115z9snSRl+w2swIrH7QnH/3qRlYGBrZTW
	 VFiS7iI2SoL+R9vImPY6IeUKj6ryOTtNYoL6nLLI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  2 Oct 2024 20:00:16 +0200 (CEST)
Message-ID: <506d56d3-540e-4675-a126-347e176b8a0d@perex.cz>
Date: Wed, 2 Oct 2024 20:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Incorrect automatic ALSA card ID when unicode is at play
To: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.de>
References: <yk3WTvKkwheOon_LzZlJ43PPInz6byYfBzpKkbasww1yzuiMRqn7n6Y8vZcXB-xwFCu_vb8hoNjv7DTNwH5TWjpEuiVsyn9HPCEXqwF4120=@protonmail.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <yk3WTvKkwheOon_LzZlJ43PPInz6byYfBzpKkbasww1yzuiMRqn7n6Y8vZcXB-xwFCu_vb8hoNjv7DTNwH5TWjpEuiVsyn9HPCEXqwF4120=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02. 10. 24 18:54, Barnabás Pőcze wrote:
> Hi
> 
> 
> When `snd_card::id` is not specified explicitly it is determined automatically
> in `sound/core/init.c:snd_card_register()` as follows:
> 
>    if (*card->id) {
>      // ...
>    } else {
>      /* create an id from either shortname or longname */
>      const char *src;
> 
>      src = *card->shortname ? card->shortname : card->longname;
>      snd_card_set_id_no_lock(card, src,
>                                    retrieve_id_from_card_name(src));
>    }
> 
> However, `snd_card_set_id_no_lock()`, or more specifically the `copy_valid_id_string()`
> function that it calls does not seem to copy very well with utf-8.
> 
> For example, based on the report at https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4135
> where `card->shortname="Redmi 电脑音箱"`, `card->id` will be set to \xE7\xE8\xE9\xE7,
> which are the first bytes of the symbols in the suffix "电脑音箱" because only those
> bytes of the string satisfy the `isalnum()` check in `copy_valid_id_string()`.
> 
> I am not sure what kind of 8-bit character set `isalnum()` is basing these results on, but
> it certainly does not mix well with utf-8 in this scenario at least.

It seems that isalnum() also returns true for characters above 0x80 (see 
lib/ctype.c):

0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                        /* 128-143 */
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,                        /* 144-159 */
_S|_SP,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,    /* 160-175 */
_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,_P,        /* 176-191 */
_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,_U,        /* 192-207 */
_U,_U,_U,_U,_U,_U,_U,_P,_U,_U,_U,_U,_U,_U,_U,_L,        /* 208-223 */
_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,_L,        /* 224-239 */
_L,_L,_L,_L,_L,_L,_L,_P,_L,_L,_L,_L,_L,_L,_L,_L};       /* 240-255 */

We should probably add isacii() check like:

diff --git a/sound/core/init.c b/sound/core/init.c
index b92aa7103589..114fb87de990 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -654,13 +654,19 @@ void snd_card_free(struct snd_card *card)
  }
  EXPORT_SYMBOL(snd_card_free);

+/* check, if the character is in the valid ASCII range */
+static inline bool safe_ascii_char(char c)
+{
+	return isascii(c) && isalnum(c);
+}
+
  /* retrieve the last word of shortname or longname */
  static const char *retrieve_id_from_card_name(const char *name)
  {
  	const char *spos = name;

  	while (*name) {
-		if (isspace(*name) && isalnum(name[1]))
+		if (isspace(*name) && safe_ascii_char(name[1]))
  			spos = name + 1;
  		name++;
  	}
@@ -687,12 +693,12 @@ static void copy_valid_id_string(struct snd_card *card, 
const char *src,
  {
  	char *id = card->id;

-	while (*nid && !isalnum(*nid))
+	while (*nid && !safe_ascii_char(*nid))
  		nid++;
  	if (isdigit(*nid))
  		*id++ = isalpha(*src) ? *src : 'D';
  	while (*nid && (size_t)(id - card->id) < sizeof(card->id) - 1) {
-		if (isalnum(*nid))
+		if (safe_ascii_char(*nid))
  			*id++ = *nid;
  		nid++;
  	}
@@ -787,7 +793,7 @@ static ssize_t id_store(struct device *dev, struct 
device_attribute *attr,

  	for (idx = 0; idx < copy; idx++) {
  		c = buf[idx];
-		if (!isalnum(c) && c != '_' && c != '-')
+		if (!safe_ascii_char(c) && c != '_' && c != '-')
  			return -EINVAL;
  	}
  	memcpy(buf1, buf, copy);


Takashi, do you have a better idea?

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
